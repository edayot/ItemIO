
data remove storage itemio:main.output Items
data modify storage itemio:main.output Items set from block ~ ~ ~ Items
data remove storage itemio:main.output Items[{components:{"minecraft:custom_data":{itemio:{gui:1b}}}}]



data remove storage itemio:main.output input
data modify storage itemio:main.output input set from storage itemio:io input
data remove storage itemio:io output


scoreboard players set #if_item_input itemio.math.output 0
scoreboard players set #if_filters_define itemio.math.output 0
execute store result score #if_item_input itemio.math.output if data storage itemio:main.output input
execute store result score #if_filters_define itemio.math.output if data storage itemio:io filters[0]

data modify storage itemio:main.output filters set from storage itemio:io filters

execute if block ~ ~ ~ #itemio:container/normal_chest if data storage itemio:main.output Items[0] run function itemio:impl/container/output/vanilla/output/loop_item


execute if block ~ ~ ~ chest[type=single] if data storage itemio:main.output Items[0] run function itemio:impl/container/output/vanilla/output/loop_item
execute if block ~ ~ ~ trapped_chest[type=single] if data storage itemio:main.output Items[0] run function itemio:impl/container/output/vanilla/output/loop_item


execute if block ~ ~ ~ chest[type=right] run function itemio:impl/container/output/vanilla/double_chest_right
execute if block ~ ~ ~ trapped_chest[type=right] run function itemio:impl/container/output/vanilla/double_chest_right

execute if block ~ ~ ~ chest[type=left] run function itemio:impl/container/output/vanilla/double_chest_left
execute if block ~ ~ ~ trapped_chest[type=left] run function itemio:impl/container/output/vanilla/double_chest_left




