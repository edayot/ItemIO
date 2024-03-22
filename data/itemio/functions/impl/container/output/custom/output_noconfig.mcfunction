


scoreboard players set #nbt_items itemio.math.output 0
execute if score #good_context_entity itemio.math.output matches 1 if entity @s[tag=itemio.container.nbt_items] run scoreboard players set #nbt_items itemio.math.output 1


#loading block data
data remove storage itemio:main.output Items
data remove storage itemio:main.output nbt_items_path
data modify storage itemio:main.output nbt_items_path set value "storage do_not_use:realy blabla"

execute if score #nbt_items itemio.math.output matches 0 run data modify storage itemio:main.output Items set from block ~ ~ ~ Items
execute 
    if score #nbt_items itemio.math.output matches 1
    run function ./nbt_items_repart:
        execute
            if entity @s[type=marker] 
            run data modify storage itemio:main.output nbt_items_path set from entity @s data.itemio.nbt_items_path
        execute
            if entity @s[type=#itemio:item_frames] 
            run data modify storage itemio:main.output nbt_items_path set from entity @s Item.components."minecraft:custom_data".itemio.nbt_items_path
        execute
            if entity @s[type=armor_stand] 
            run data modify storage itemio:main.output nbt_items_path set from entity @s ArmorItems[3].components."minecraft:custom_data".itemio.nbt_items_path
        execute
            if entity @s[type=#itemio:item_display] 
            run data modify storage itemio:main.output nbt_items_path set from entity @s item.components."minecraft:custom_data".itemio.nbt_items_path
        
        execute if entity @s[tag=itemio.container.nbt_items.on_passengers] on passengers run function ./nbt_items with storage itemio:main.output {}
        execute if entity @s[tag=itemio.container.nbt_items.on_vehicle] on vehicle run function ./nbt_items with storage itemio:main.output {}
        execute if entity @s[tag=!itemio.container.nbt_items.on_passengers,tag=!itemio.container.nbt_items.on_vehicle] run function ./nbt_items with storage itemio:main.output {}


function ./nbt_items:
    $execute unless data $(nbt_items_path) run data modify $(nbt_items_path) set value []
    $data modify storage itemio:main.output Items set from $(nbt_items_path)
    

data remove storage itemio:main.output Items[{tag:{itemio:{gui:1b}}}]

data remove storage itemio:main.output input
data modify storage itemio:main.output input set from storage itemio:io input
data remove storage itemio:io output

data modify storage itemio:main.output filters set value []
data modify storage itemio:main.output filters set from storage itemio:io filters

scoreboard players set #if_item_input itemio.math.output 0
scoreboard players set #if_filters_define itemio.math.output 0
execute store result score #if_filters_define itemio.math.output if data storage itemio:main.output filters[0]
execute store result score #if_item_input itemio.math.output if data storage itemio:main.output input


data remove storage itemio:main.output temp.args_loop_ioconfig
data modify storage itemio:main.output temp.args_loop_ioconfig.output_side set from storage itemio:io output_side
# tellraw @p [{"text":"Items : "},{"nbt":"Items","storage":"itemio:main.output"}]
# tellraw @p [{"text":"ioconfig : "},{"nbt":"ioconfig","storage":"itemio:main.output"}]

execute if data storage itemio:main.output ioconfig[0] run function itemio:impl/container/output/custom/output_noconfig/loop_ioconfig with storage itemio:main.output temp.args_loop_ioconfig
