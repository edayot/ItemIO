data remove storage itemio:main servo_filters
data remove storage itemio:main servo_items


data modify storage itemio:main servo_filters set from entity @s data.itemio.ioconfig.filters
data modify storage itemio:main servo_items set from entity @s data.itemio.ioconfig.items

execute store result score #if_filters_defined2 itemio.math if data storage itemio:main servo_filters[0] 
execute store result score #if_items_defined2 itemio.math if data storage itemio:main servo_items[0] 

execute if score #if_filters_defined2 itemio.math matches 1 run function itemio:container/output/try_input_after/loop_filters
execute if score #if_filters_defined2 itemio.math matches 0 if score #if_items_defined2 itemio.math matches 1 run function itemio:container/output/try_input_after/loop_items
execute if score #if_filters_defined2 itemio.math matches 0 if score #if_items_defined2 itemio.math matches 0 run function itemio:container/output/try_input_after/loop_normal



