scoreboard players set #network_as_insert itemio.math 1

execute store result score #rotation_0 itemio.math run data get entity @s Rotation[0]
execute store result score #rotation_1 itemio.math run data get entity @s Rotation[1]

data remove storage itemio:main entity
execute
    if score #rotation_0 itemio.math matches 0
    if score #rotation_1 itemio.math matches 90
    run data modify storage itemio:main entity.input_side set value "bottom"

execute 
    if score #rotation_0 itemio.math matches 0
    if score #rotation_1 itemio.math matches -90
    run data modify storage itemio:main entity.input_side set value "top"

execute
    if score #rotation_0 itemio.math matches 180
    if score #rotation_1 itemio.math matches 0
    run data modify storage itemio:main entity.input_side set value "north"
execute 
    if score #rotation_0 itemio.math matches 0
    if score #rotation_1 itemio.math matches 0
    run data modify storage itemio:main entity.input_side set value "south"

execute
    if score #rotation_0 itemio.math matches 90
    if score #rotation_1 itemio.math matches 0
    run data modify storage itemio:main entity.input_side set value "west"
execute
    if score #rotation_0 itemio.math matches 270
    if score #rotation_1 itemio.math matches 0
    run data modify storage itemio:main entity.input_side set value "east"

execute 
    if entity @s[type=#itemio:item_frames]
    run function ~/item_frames:
        execute
            if data entity @s Item.components."minecraft:custom_data".itemio.ioconfig.filters 
            run data modify storage itemio:main entity.filters set from entity @s Item.components."minecraft:custom_data".itemio.ioconfig.filters
execute 
    if entity @s[type=marker] 
    run function ~/marker:
        execute 
            if data entity @s data.itemio.ioconfig.filters 
            run data modify storage itemio:main entity.filters set from entity @s data.itemio.ioconfig.filters
execute
    if entity @s[type=armor_stand] 
    run function ~/armor_stand:
        execute 
            if data entity @s ArmorItems[3].components."minecraft:custom_data".itemio.ioconfig.filters 
            run data modify storage itemio:main entity.filters set from entity @s ArmorItems[3].components."minecraft:custom_data".itemio.ioconfig.filters
execute
    if entity @s[type=#itemio:item_display] 
    run function ~/item_display:
        execute 
            if data entity @s item.components."minecraft:custom_data".itemio.ioconfig.filters 
            run data modify storage itemio:main entity.filters set from entity @s item.components."minecraft:custom_data".itemio.ioconfig.filters
scoreboard players operation #temp_stack_limit itemio.math = @s itemio.servo.stack_limit
execute 
    summon marker 
    run function itemio:impl/servo/generate_destination:
        tag @s add itemio.transfer.destination
        tag @s add itemio.transfer.destination.temp
        data modify entity @s data.itemio.ioconfig set from storage itemio:main entity
        scoreboard players operation @s itemio.servo.stack_limit = #temp_stack_limit itemio.math