#sayloop

data remove storage itemio:main servo_filters2
data remove storage itemio:main servo_items2



#tellraw @a {"nbt":"data.itemio.ioconfig.filters","entity":"@s"}



data modify storage itemio:main servo_filters2 set from entity @s data.itemio.ioconfig.filters
data modify storage itemio:main servo_items2 set from entity @s data.itemio.ioconfig.items

execute store result score #if_filters_defined2 itemio.math if data storage itemio:main servo_filters2[0] 
execute store result score #if_items_defined2 itemio.math if data storage itemio:main servo_items2[0] 

execute if score #if_filters_defined2 itemio.math matches 1 run function itemio:impl/container/output/try_input_after/loop_filters
execute if score #if_filters_defined2 itemio.math matches 0 if score #if_items_defined2 itemio.math matches 1 run function itemio:impl/container/output/try_input_after/loop_items
execute if score #if_filters_defined2 itemio.math matches 0 if score #if_items_defined2 itemio.math matches 0 run function itemio:impl/container/output/try_input_after/loop_normal



execute if score #success_input itemio.io matches 0 run tag @s add itemio.transfer.destination.already
execute if score #success_input itemio.io matches 0 as @e[tag=itemio.transfer.destination.good_distance,tag=!itemio.transfer.destination.already,limit=1,sort=nearest] unless entity @s[distance=..0.5001] at @s run function itemio:impl/container/output/try_input_after/loop
