data remove storage itemio:main.input Items
data modify storage itemio:main.input Items set from block ~ ~ ~ Items
data remove storage itemio:main.input Items[{components:{"minecraft:custom_data":{itemio:{gui:1b}}}}]

data remove storage itemio:main.input disabled_slots
data modify storage itemio:main.input disabled_slots set from block ~ ~ ~ disabled_slots


data remove storage itemio:main.input input
data modify storage itemio:main.input input set from storage itemio:io input



# algo :
# Sorting global
# on enlève les items de la listes qui ne sont pas identiques à l'input (sauf l'air), et on modifie la valeur du storage d'interdiction
# On doit sort les slots du plus petit count au plus grand
# Si égaux, c'est la valeur de "Slot" du NBT qui est utilisée

# Filtrage
# Si le slot n'as pas d'items, son count est 0, si il est désactivé, il n'est pas dans la liste

# Résolution
# de là on ajoute un par un des items en partant du plus petit
# dès qu'on ajoute un item, on update la position du slot dans la liste

# Résultat
# Ensuite on modifie le block en le copiant vers le storage
# On a bien ajouter les ites un a un de la façon la plus rapide

# En réalité dan sle sorting on peut faire mieux en excluant déjà les slots désactivité







scoreboard players set #slot_clean itemio.math.input 0
function ~/cleaning {slot_clean:0}


