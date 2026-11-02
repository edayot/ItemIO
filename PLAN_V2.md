# ItemIO V2 — Plan (objectif n°1 : les performances)

> Cible : Minecraft 26.3 uniquement, version **2.0.0** (semver majeure : il y a des breaking changes).
> Chaque étape est validée par `uv run beet test` (aucun test ne doit échouer) **et** par
> `uv run python bench/run.py --compare baseline-1.8.1`.

**Statut : P0 à P7 implémentées, rien n'est commité.** Tests : 17/17 (7 tests existants + 10 nouveaux).
La version de `beet.yaml` et de `pyproject.toml` reste 1.8.1 : python-semantic-release passera en 2.0.0
si le commit porte un footer `BREAKING CHANGE:`.

## 0. Décisions prises

| Question | Décision |
| --- | --- |
| Suppression du test `itemio:loot_tables` (override de la shulker jaune) | accord donné, test supprimé |
| Protection des hoppers | toujours à chaque tick, 1 test de tag au lieu de 19 |
| Gamerules `max_command_forks` / `max_command_sequence_length` | inchangées (toujours forcées au load) |
| API auto_handled | `itemio:io offer` + `#itemio:calls/offer`, sans alias de l'ancienne API |
| Filtre `minecraft` | déprécié, toujours supporté |

## 1. Résultats (baseline 1.8.1 vs V2)

Harnais : `beet-bench.yaml` + `bench/` (tests ward chronométrés avec `/stopwatch`, hors de la suite normale).
Chaque scénario vérifie l'état final par un `assert`. Bruit d'une exécution à l'autre : ±10 %.
Résultats bruts : `bench/results/baseline-1.8.1.json` et `bench/results/v2.json`.

| Scénario | 1.8.1 (µs/op) | V2 (µs/op) | Gain |
| --- | ---: | ---: | ---: |
| `input_vanilla` (1 item dans un baril) | 89 | 23 | ×3,9 |
| `input_vanilla_scan` (seul le dernier slot convient) | 883 | 17–33 | ×27–53 |
| `output_vanilla` | 34 | 31 | ×1,1 |
| `output_vanilla_filtered` | 425 | 295 | ×1,4 |
| `transfer_vanilla` | 171 | 78 | ×2,2 |
| `transfer_vanilla_3k_entities` | 780 | 134 | ×5,8 |
| `input_custom` | 137 | 103 | ×1,3 |
| `output_custom` | 67 | 64 | ×1,05 |
| `filters_id` | 24,5 | 10,5 | ×2,3 |
| `filters_minecraft_tag` (déprécié, inchangé) | 87 | 92 | ×0,95 (bruit) |
| `hopper_emulation` | 447 | 183 | ×2,4 |
| `network_process` | 1550 | 750 | ×2,1 |
| `network_idle_process` | 230 | 60 | ×3,8 |
| `tick_100_vanilla_containers` | 440 | 200 | ×2,2 |
| `tick_100_custom_containers` | 210 | 120 | ×1,8 |
| `tick_idle_3k_entities` (aucune entité ItemIO) | 205 | 105 | ×2,0 |

Les deux benchs réseau avancent désormais `#global_tick` à chaque itération : un réseau n'est traité
qu'une fois par tick en V2 (score `itemio.servo.processed_tick` au lieu du tag `itemio.servo.already`).

## 2. Diagnostic et correctifs appliqués

| # | Point chaud 1.8.1 | Correctif V2 | Phase |
| --- | --- | --- | --- |
| H1 | ~15 sélecteurs `@e` sans position par transfert | dispatch par un seul sélecteur borné (`distance=..0.5001`), destinations en liste en storage | P3 |
| H2 | insertion vanilla via shulker jaune + baril, boucle macro par slot | `loot insert` direct avec une entrée `minecraft:slots` qui lit l'item du helper, comptage par `if items` | P2 |
| H3 | config lue par type d'entité + chemin macro `ioconfig_from_storage` | une lecture de `data.itemio` (fallback legacy) | P1 |
| H4 | max stack size recalculé par slot, échelle de 99 `if items` | une fois par appel, `set_count 99` clampé + `if items` | P4 |
| H5 | 19 tests de tag + prédicats par conteneur et par tick | tag récapitulatif `itemio.container.hopper_protection` | P5 |
| H6 | 5 scans globaux par tick | 2 scans par tick + scan des hopper minecarts tous les 4 ticks | P5 |
| H7 | markers invoqués puis tués à chaque traitement de réseau et cycle de hopper | destinations en storage (absolues ou relatives), cible des servos en cache dans `data.itemio.target` | P3 |
| H8 | `retry_limit` transferts même quand rien ne bouge | arrêt au premier transfert échoué | P5 |
| H9 | filtres `id` / `smithed` / `ctc` élément par élément | une macro + matching partiel des listes NBT | P4 |
| — | prédicats (contexte de loot par entité) dans les sélecteurs de servos et de conteneurs | comparaisons de scores directes | P5 |
| — | appels internes via les tags publics (vérification de version à chaque appel) | appels directs aux fonctions d'implémentation | P4 |

## 3. Shulker jaune et baril

Ils ne sont plus nécessaires. `execute as <helper> run loot insert ~ ~ ~ loot itemio:impl/internal/helper_item`
insère directement dans le vrai conteneur l'item porté par l'item_display helper, avec le même algorithme
(`distributeToContainer`). Le nombre inséré se déduit de deux `execute if items block ~ ~ ~ container.* *`.
L'override de `minecraft:blocks/yellow_shulker_box` est supprimé et les deux blocs ne sont plus posés
(ils restent dans les mondes créés avant 2.0.0).
L'item_display `a97c9c67-…` et le forceload restent (helper des filtres, du max stack et de l'insertion).

## 4. Phases

### P0 — Outillage et tests de caractérisation ✅
- Harnais de bench + baseline, section « Benchmarks » de `docs/contributing.md`.
- Structure vide `itemio_test:empty_5x3x5`, module `itemio_test:test_utils`.
- Tout ce qui ne sert qu'aux tests (tests, structures, helpers, benchs) est dans le namespace `itemio_test`,
  supprimé des builds de release par `airdox_.remove_test_namespace` (`-s meta.airdox_.release=true`, ajouté au `build_command`).
- Nouveaux tests : `vanilla_input`, `vanilla_double_chest`, `vanilla_output`, `custom_io`, `legacy_config`,
  `transfer_destinations`, `hopper_emulation`. Ils passaient tous sur 1.8.1, sauf les cas de bugs, ajoutés avec leur correctif.
- Piège rencontré : avec `formatting: preserve`, mecha recopie le texte source entre deux commandes selon leur emplacement.
  Une commande émise depuis un module bolt garde l'emplacement du module et peut atterrir dans un commentaire
  du fichier de test (`# nearest destinscoreboard players set …`). Les helpers de test retournent donc des
  commandes en texte, émises par un `emit` local à chaque test.

### P1 — Config dans `data`, fin de `ioconfig_from_storage` ✅
- `container/{input,output}/read_config` : `data.itemio`, puis fallback sur l'item (item_frame, armor_stand, item_display).
- Servos : `data.itemio.ioconfig`, puis fallback `Item.components."minecraft:custom_data".itemio.ioconfig`.
- `itemio/types.py` : `ioconfig_from_storage` retiré, `nbt_items_path` et `max_stack_size` ajoutés.

### P2 — Insertion vanilla par `loot insert` ✅
- `container/input/vanilla/{input,insert,result,double_chest_left,double_chest_right}`.
- Double coffre : moitié droite d'abord, le reste va dans la moitié gauche.

### P3 — Plus de sélecteur global dans les chemins chauds ✅
- `transfer` : `itemio:io destinations` (nouvelle API), sinon un seul scan des markers.
- `try_input_after` : parcourt la liste des destinations, macros `positioned` absolues ou relatives.
- Servos : `data.itemio.target` (bloc + côté) calculé à l'init, ou à la première utilisation pour les servos existants.
- Émulation des hoppers : destinations relatives, plus aucun marker.

### P4 — Chemins custom et filtres ✅
- Slots autorisés d'un côté filtrés en une commande, max stack calculé une fois, slot vide ignoré à l'output.
- Filtres `id` / `smithed.id` / `ctc` en une macro ; filtre `merge` réécrit en storage.

### P5 — Tick global et réseaux inactifs ✅
- Lazy upgrade des conteneurs existants (tag `itemio.container.v2`) ; scan des hopper minecarts tous les 4 ticks.
- Score `itemio.servo.processed_tick`, scores à la place des prédicats, arrêt des retries au premier échec.

### P6 — `auto_handled_io` ✅
- Input : le conteneur ne règle que `#count_to_remove itemio.io` ; ItemIO calcule le reste et gère le cooldown des servos.
- Output : `itemio:io offer` + `#itemio:calls/offer` ; le contexte de l'appel est restauré après chaque offre.
- Test `auto_handled_io` avec un conteneur de test (`itemio_test:auto_handled_*`, enregistré dans les event tags
  en `required: false`, sans effet hors du tag `itemio.test.auto_container`).
- SimpleDrawer migré vers `offer` (non commité). Testé contre un zip local d'ItemIO V2 : les transferts hopper → tiroir
  et tiroir → hopper de `simpledrawer:hopper_test` passent. Le test échoue ensuite, comme avec 1.8.1, sur une
  assertion périmée (version 2.10 du tiroir attendue, SimpleDrawer est en 2.11).

### P7 — Corrections, docs ✅
- Bugs corrigés (voir §6), docs mises à jour, page `docs/migration/v2.md`.

## 5. Breaking changes

Détail complet dans `docs/migration/v2.md`.

| # | Changement |
| --- | --- |
| B1 | Config lue dans `data.itemio` pour toutes les entités (anciens emplacements en fallback, `data` gagne) |
| B2 | `itemio.container.ioconfig_from_storage` / `itemio.ioconfig_from_storage` supprimés |
| B3 | Nouvelle API auto_handled (`offer`, `#itemio:calls/offer`, `#count_to_remove itemio.io`), `#itemio:calls/auto_handled_output` supprimé |
| B4 | `nope` et `auto_handled_io` n'utilisent plus le bloc vanilla sous l'entité |
| B5 | Override de `minecraft:blocks/yellow_shulker_box` supprimé, blocs du forceload plus posés |
| B6 | Tags `hopper_protection_{offset}` lus à l'init (ou au premier tick pour les conteneurs existants) |
| B7 | Transferts : destinations triées par distance à l'origine ; `input_side` lu dans `data.itemio.input_side` ou `data.itemio.ioconfig.input_side` (sinon aucun) ; `items` comparés à l'item ; count d'input ≤ 99 |
| B8 | Servos : insert servos triés par leur propre position ; arrêt des retries au premier échec ; `#max_network_per_tick 0` = sans limite, `#max_servos_per_tick` appliqué |
| B9 | Double coffre : le reste de l'input va dans la moitié gauche |
| B10 | Hopper minecarts réactivés au plus 4 ticks plus tard |
| B11 | État interne (storages `itemio:main*`, scores `itemio.math*`, tag `itemio.servo.already`) modifié |
| — | Ajouts : `itemio:io destinations`, `#itemio:calls/offer`, `#itemio:calls/container/destroy`, filtre `ctc` par source (entrée sans `id`) ; filtre `minecraft` déprécié |

## 6. Bugs de 1.8.1 corrigés (avec tests)

- Output d'un conteneur custom : succès sans item quand le premier slot autorisé est vide.
- Output d'un double coffre est/ouest : la moitié gauche jamais atteinte depuis la droite.
- Alambic : le slot carburant acceptait n'importe quel item (filtre compound au lieu d'une liste).
- Une shulker box acceptée dans une shulker box (garde-fou écrit dans le chemin NBT `container.0` du helper).
- Filtre `merge` toujours invalide (même chemin NBT `container.0`).
- Jukebox : vérification du disque sur un item périmé du helper (même cause).
- `items` d'une destination comparés aux `items` du servo extract.
- Output `nbt_items` : retirait `#max_output_count` items même quand moins étaient déplacés.
- Items GUI supprimés des conteneurs vanilla par un input.
- `#max_network_per_tick 0` bloquait tout ; `#max_servos_per_tick` n'était jamais appliqué.
- `#itemio:calls/container/destroy` documenté mais inexistant : ajouté (vide pour l'instant, réservé pour la suite).

## 7. Points ouverts

- L'output vanilla sans filtre reste au niveau de 1.8.1 : il lit tout le conteneur (`data … from block`).
- SimpleDrawer : passer la dépendance `itemio` à `2.0.0` dans `beet.yaml` une fois la release publiée
  (le code migré appelle `#itemio:calls/offer`, absent de 1.8.1).
