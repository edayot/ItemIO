execute positioned ^ ^ ^-1 align xyz run summon marker ~.5 ~.5 ~.5 {Tags:["itemio.transfer.destination","itemio.transfer.destination.temp","itemio.summoned"]}

data remove storage itemio:main entity
execute store result score #facing itemio.math run data get entity @s Facing

execute if score #facing itemio.math matches 0 run data modify storage itemio:main entity.input_side set value "bottom"
execute if score #facing itemio.math matches 1 run data modify storage itemio:main entity.input_side set value "top"

execute if score #facing itemio.math matches 2 run data modify storage itemio:main entity.input_side set value "north"
execute if score #facing itemio.math matches 3 run data modify storage itemio:main entity.input_side set value "south"

execute if score #facing itemio.math matches 4 run data modify storage itemio:main entity.input_side set value "west"
execute if score #facing itemio.math matches 5 run data modify storage itemio:main entity.input_side set value "east"


execute if data entity @s Item.tag.itemio.ioconfig.filters run data modify storage itemio:main entity.filters set from entity @s Item.tag.itemio.ioconfig.filters
execute if data entity @s Item.tag.itemio.ioconfig.items run data modify storage itemio:main entity.items set from entity @s Item.tag.itemio.ioconfig.items

data modify entity @e[tag=itemio.summoned,limit=1] data.itemio.ioconfig set from storage itemio:main entity

scoreboard players operation @e[tag=itemio.summoned,limit=1] itemio.servo.stack_limit = @s itemio.servo.stack_limit


tag @e[tag=itemio.summoned] remove itemio.summoned