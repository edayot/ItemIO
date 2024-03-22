
function ./ioconfig_storage:
    $data modify storage itemio:main.input ioconfig set from storage $(storage)


#loading ioconfig
data remove storage itemio:main.input ioconfig 

scoreboard players set #ioconfig_from_storage itemio.math.input 0
execute if entity @s[tag=itemio.container.ioconfig_from_storage] run scoreboard players set #ioconfig_from_storage itemio.math.input 1

execute 
    if score #ioconfig_from_storage itemio.math.input matches 0
    run function ./input_normal:
        execute 
            if entity @s[type=marker] 
            run data modify storage itemio:main.input ioconfig set from entity @s data.itemio.ioconfig
        execute
            if entity @s[type=#itemio:item_frames] 
            run data modify storage itemio:main.input ioconfig set from entity @s Item.components."minecraft:custom_data".itemio.ioconfig

        execute
            if entity @s[type=armor_stand] 
            run data modify storage itemio:main.input ioconfig set from entity @s ArmorItems[3].components."minecraft:custom_data".itemio.ioconfig

        execute
            if entity @s[type=#itemio:item_display] 
            run data modify storage itemio:main.input ioconfig set from entity @s item.components."minecraft:custom_data".itemio.ioconfig
execute
    if score #ioconfig_from_storage itemio.math.input matches 1
    run function ./input_storage:
        execute
            if entity @s[type=marker] 
            run function ./ioconfig_storage with entity @s data.itemio.ioconfig
        execute
            if entity @s[type=#itemio:item_frames] 
            run function ./ioconfig_storage with entity @s Item.components."minecraft:custom_data".itemio.ioconfig
        execute
            if entity @s[type=armor_stand] 
            run function ./ioconfig_storage with entity @s ArmorItems[3].components."minecraft:custom_data".itemio.ioconfig
        execute
            if entity @s[type=#itemio:item_display] 
            run function ./ioconfig_storage with entity @s item.components."minecraft:custom_data".itemio.ioconfig

data remove storage itemio:main.input ioconfig[{mode:"output"}]

scoreboard players set #good_context_entity itemio.math.input 1
execute if data storage itemio:main.input ioconfig if data storage itemio:io input run function itemio:impl/container/input/custom/input_noconfig
scoreboard players set #good_context_entity itemio.math.input 0

