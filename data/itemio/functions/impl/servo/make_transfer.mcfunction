execute store result score #facing itemio.math run data get entity @s Facing

execute if score #facing itemio.math matches 0 run data modify storage itemio:io output_side set value "bottom"
execute if score #facing itemio.math matches 1 run data modify storage itemio:io output_side set value "top"

execute if score #facing itemio.math matches 2 run data modify storage itemio:io output_side set value "north"
execute if score #facing itemio.math matches 3 run data modify storage itemio:io output_side set value "south"

execute if score #facing itemio.math matches 4 run data modify storage itemio:io output_side set value "west"
execute if score #facing itemio.math matches 5 run data modify storage itemio:io output_side set value "east"

data remove storage itemio:main servo_filters
data remove storage itemio:main servo_items


data modify storage itemio:main servo_filters set from entity @s Item.components."minecraft:custom_data".itemio.ioconfig.filters
data modify storage itemio:main servo_items set from entity @s Item.components."minecraft:custom_data".itemio.ioconfig.items

execute store result score #if_items_defined itemio.math if data storage itemio:main servo_items[0] 

scoreboard players set #nb_retry itemio.math 1
scoreboard players operation #nb_retry itemio.math = @s itemio.servo.retry_limit
execute unless score #nb_retry itemio.math matches 1.. run scoreboard players set #nb_retry itemio.math 1

function itemio:impl/servo/make_transfer_loop
