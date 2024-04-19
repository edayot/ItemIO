
scoreboard players operation #own_network.low itemio.math = @s itemio.network_id.low
scoreboard players operation #own_network.high itemio.math = @s itemio.network_id.high

execute as @e[type=#itemio:servos,tag=itemio.servo.initialised,predicate=itemio:impl/internal/same_id] run function itemio:impl/servo/add_tags

scoreboard players set #network_as_insert itemio.math 0
execute as @e[type=#itemio:servos,tag=itemio.servo.same_network,tag=itemio.servo.insert,scores={itemio.servo.cooldown=0}] 
    at @s positioned ^ ^ ^-1 
    align xyz 
    positioned ~.5 ~.5 ~.5
    run function itemio:impl/servo/get_facing:
        scoreboard players set #network_as_insert itemio.math 1

        execute store result score #facing itemio.math run data get entity @s Facing
        data remove storage itemio:main entity
        execute if score #facing itemio.math matches 0 run data modify storage itemio:main entity.input_side set value "bottom"
        execute if score #facing itemio.math matches 1 run data modify storage itemio:main entity.input_side set value "top"

        execute if score #facing itemio.math matches 2 run data modify storage itemio:main entity.input_side set value "north"
        execute if score #facing itemio.math matches 3 run data modify storage itemio:main entity.input_side set value "south"

        execute if score #facing itemio.math matches 4 run data modify storage itemio:main entity.input_side set value "west"
        execute if score #facing itemio.math matches 5 run data modify storage itemio:main entity.input_side set value "east"
        execute if data entity @s Item.components."minecraft:custom_data".itemio.ioconfig.filters run data modify storage itemio:main entity.filters set from entity @s Item.components."minecraft:custom_data".itemio.ioconfig.filters
        execute if data entity @s Item.components."minecraft:custom_data".itemio.ioconfig.items run data modify storage itemio:main entity.items set from entity @s Item.components."minecraft:custom_data".itemio.ioconfig.items
        scoreboard players operation #temp_stack_limit itemio.math = @s itemio.servo.stack_limit
        execute 
            summon marker 
            run function itemio:impl/servo/generate_destination:
                tag @s add itemio.transfer.destination
                tag @s add itemio.transfer.destination.temp
                data modify entity @s data.itemio.ioconfig set from storage itemio:main entity
                scoreboard players operation @s itemio.servo.stack_limit = #temp_stack_limit itemio.math



scoreboard players set #servos_transfer itemio.math 1
execute 
    if score #network_as_insert itemio.math matches 1
    as @e[tag=itemio.servo.same_network,tag=itemio.servo.extract] 
    at @s 
    run function itemio:impl/servo/make_transfer
scoreboard players set #servos_transfer itemio.math 0

tag @e[tag=itemio.servo.same_network] remove itemio.servo.same_network
kill @e[tag=itemio.transfer.destination.temp]