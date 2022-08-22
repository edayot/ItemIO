execute store result score #facing itemio.math run data get entity @s Facing

execute if score #facing itemio.math matches 0 run data modify storage itemio:io output_side set value "bottom"
execute if score #facing itemio.math matches 1 run data modify storage itemio:io output_side set value "top"

execute if score #facing itemio.math matches 2 run data modify storage itemio:io output_side set value "north"
execute if score #facing itemio.math matches 3 run data modify storage itemio:io output_side set value "south"

execute if score #facing itemio.math matches 4 run data modify storage itemio:io output_side set value "west"
execute if score #facing itemio.math matches 5 run data modify storage itemio:io output_side set value "east"

data remove storage itemio:main servo_filters
data remove storage itemio:main servo_items


data modify storage itemio:main servo_filters set from entity @s Item.tag.itemio.ioconfig.filters
data modify storage itemio:main servo_items set from entity @s Item.tag.itemio.ioconfig.filters

execute store result score #if_filters_defined itemio.math if data storage itemio:main servo_filters[0] 
execute store result score #if_items_defined itemio.math if data storage itemio:main servo_items[0] 


execute if score #if_filters_defined itemio.math matches 1 run function itemio:v0.0.1/servo/make_transfer_filters
execute if score #if_filters_defined itemio.math matches 0 if score #if_items_defined itemio.math matches 1 run function itemio:v0.0.1/servo/make_transfer_items
execute if score #if_filters_defined itemio.math matches 0 if score #if_items_defined itemio.math matches 0 run function itemio:v0.0.1/servo/make_transfer_normal
