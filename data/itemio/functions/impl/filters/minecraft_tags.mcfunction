from beet import Context, Predicate
import json
import semver


def cache_tag_list(ctx: Context):
    """
    Cache the list of tags.
    """
    mc_versions = ctx.meta["mc_supports"]
    MC_VERSION = mc_versions[-1]
    URL = f"https://raw.githubusercontent.com/misode/mcmeta/{MC_VERSION}-registries/tag/item/data.json"
    cache = ctx.cache["itemio"]
    return cache.download(URL)

path = cache_tag_list(ctx)

with open(path) as f:
    tags = json.load(f)


execute 
    if score #filter.valid_item itemio.io matches 1 
    if data storage itemio:io filter.minecraft 
    as 93682a08-d099-4e8f-a4a6-1e33a3692301 
    run function ~/_check_all:
        for tag in tags:
            function_name = "itemio:impl/filters/minecraft_tags/" + tag
            raw f"execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.minecraft.\"{tag}\" run function {function_name}"
            function function_name:
                scoreboard players set #filter.valid_item itemio.io 0
                data modify entity @s equipment.mainhand set value {}
                data modify entity @s equipment.mainhand set from storage itemio:io item
                raw f"execute if predicate itemio:impl/minecraft/{tag} run scoreboard players set #filter.valid_item itemio.io 1"
            
            predicate_tag = {
                "condition": "minecraft:entity_properties",
                "entity": "this",
                "predicate": {
                    "equipment": {
                        "mainhand": {
                            "items": f"#minecraft:{tag}"
                        }
                    }
                }
            }
            ctx.data.predicates[f"itemio:impl/minecraft/{tag}"] = Predicate(predicate_tag)