
# Merge filter
#say MERGE

scoreboard players set #filter.valid_item itemio.io 0


data modify entity @s HandItems[0] set value {id:"minecraft:air",Count:1b}
data modify entity @s HandItems[0] set from storage itemio:io item

item modify entity @s weapon.mainhand itemio:impl/internal/filter/merge

scoreboard players set #!same_id itemio.math 1
execute store success score #!same_id itemio.math run data modify entity @s HandItems[0] set from storage itemio:io item

execute if score #!same_id itemio.math matches 0 run scoreboard players set #filter.valid_item itemio.io 1

