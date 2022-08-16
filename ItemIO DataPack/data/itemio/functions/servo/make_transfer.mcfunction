execute store result score #facing itemio.math run data get entity @s Facing

execute if score #facing itemio.math matches 0 run data modify storage itemio:io output_side set value "bottom"
execute if score #facing itemio.math matches 1 run data modify storage itemio:io output_side set value "top"

execute if score #facing itemio.math matches 2 run data modify storage itemio:io output_side set value "north"
execute if score #facing itemio.math matches 3 run data modify storage itemio:io output_side set value "south"

execute if score #facing itemio.math matches 4 run data modify storage itemio:io output_side set value "west"
execute if score #facing itemio.math matches 5 run data modify storage itemio:io output_side set value "east"

data remove storage itemio:io filter
data remove storage itemio:io input


execute if data entity @s Item.tag.itemio.ioconfig.filter run data modify storage itemio:io filter set from entity @s Item.tag.itemio.ioconfig.filter
execute if data entity @s Item.tag.itemio.ioconfig.item run data modify storage itemio:io item set from entity @s Item.tag.itemio.ioconfig.item

scoreboard players operation #max_output_count itemio.math.output = @s itemio.servo.stack_limit

execute positioned ^ ^ ^-1 align xyz positioned ~.5 ~.5 ~.5 run function #itemio:calls/transfer
