
data remove storage itemio:main.output Items
data modify storage itemio:main.output Items set from block ~ ~ ~ Items
data remove storage itemio:main.output Items[{tag:{itemio:{gui:1b}}}]
data remove storage itemio:main.output Items[{tag:{simplenergy:{texture_item:1b}}}]
scoreboard players set #if_item_block itemio.math.output 0
execute if data storage itemio:main.output Items[0] run scoreboard players set #if_item_block itemio.math.output 1
#loading block data
data remove storage itemio:main.output input
data modify storage itemio:main.output input set from storage itemio:io input
data remove storage itemio:io output


scoreboard players set #if_item_input itemio.math.output 0
scoreboard players set #if_filters_define itemio.math.output 0
execute store result score #if_item_input itemio.math.output if data storage itemio:main.output input
execute store result score #if_filters_define itemio.math.output if data storage itemio:io filters[0]

execute if score #if_item_block itemio.math.output matches 1 if block ~ ~ ~ #itemio:container/normal_chest run function itemio:impl/container/output/vanilla/normal/repart

execute if score #if_item_block itemio.math.output matches 1 if block ~ ~ ~ chest[type=single] run function itemio:impl/container/output/vanilla/normal/repart
execute if score #if_item_block itemio.math.output matches 1 if block ~ ~ ~ trapped_chest[type=single] run function itemio:impl/container/output/vanilla/normal/repart

execute if block ~ ~ ~ chest[type=right] run function itemio:impl/container/output/vanilla/double_chest_right
execute if block ~ ~ ~ trapped_chest[type=right] run function itemio:impl/container/output/vanilla/double_chest_right

execute if block ~ ~ ~ chest[type=left] run function itemio:impl/container/output/vanilla/double_chest_left
execute if block ~ ~ ~ trapped_chest[type=left] run function itemio:impl/container/output/vanilla/double_chest_left




