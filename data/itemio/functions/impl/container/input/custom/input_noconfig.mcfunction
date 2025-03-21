

for facebbbb in ["north","south","east","west","top","bottom"]:
    name = "itemio:impl/container/input/custom/input_no_config/loop_ioconfig/"+facebbbb
    function name:
        scoreboard players set #test_side itemio.math.input 1
        raw f"execute if data storage itemio:main.input ioconfig[0].allowed_side{{{facebbbb}:1b}} run function itemio:impl/container/input/custom/input_no_config/check_filters"
        data remove storage itemio:main.input ioconfig[0]
        function itemio:impl/container/input/if_item_input
        execute if score #temp_success_lol itemio.math.input matches 1 if data storage itemio:main.input ioconfig[0] run function name

function itemio:impl/container/input/custom/input_no_config/loop_ioconfig:
    scoreboard players set #test_side itemio.math.input 1
    function itemio:impl/container/input/custom/input_no_config/check_filters
    data remove storage itemio:main.input ioconfig[0]
    function itemio:impl/container/input/if_item_input
    execute if score #temp_success_lol itemio.math.input matches 1 if data storage itemio:main.input ioconfig[0] run function itemio:impl/container/input/custom/input_no_config/loop_ioconfig 



scoreboard players set #nbt_items itemio.math.input 0
execute if score #good_context_entity itemio.math.input matches 1 if entity @s[tag=itemio.container.nbt_items] run scoreboard players set #nbt_items itemio.math.input 1



#loading block data
data remove storage itemio:main.input Items
data remove storage itemio:main.input nbt_items_path
data modify storage itemio:main.input nbt_items_path set value "storage do_not_use:realy blabla"
execute if score #nbt_items itemio.math.input matches 0 run data modify storage itemio:main.input Items set from block ~ ~ ~ Items
execute 
    if score #nbt_items itemio.math.input matches 1
    run function ./nbt_items_repart:
        execute
            if entity @s[type=marker] 
            run data modify storage itemio:main.input nbt_items_path set from entity @s data.itemio.nbt_items_path
        execute
            if entity @s[type=#itemio:item_frames] 
            run data modify storage itemio:main.input nbt_items_path set from entity @s Item.components."minecraft:custom_data".itemio.nbt_items_path
        execute
            if entity @s[type=armor_stand] 
            run data modify storage itemio:main.input nbt_items_path set from entity @s equipment.head.components."minecraft:custom_data".itemio.nbt_items_path
        execute
            if entity @s[type=#itemio:item_display] 
            run data modify storage itemio:main.input nbt_items_path set from entity @s item.components."minecraft:custom_data".itemio.nbt_items_path
        
        scoreboard players set #nb_entities itemio.math.input 0
        execute if entity @s[tag=itemio.container.nbt_items.on_passengers] on passengers run function ./nbt_items with storage itemio:main.input {}
        execute if entity @s[tag=itemio.container.nbt_items.on_vehicle] on vehicle run function ./nbt_items with storage itemio:main.input {}
        execute if entity @s[tag=!itemio.container.nbt_items.on_passengers,tag=!itemio.container.nbt_items.on_vehicle] run function ./nbt_items with storage itemio:main.input {}


function ./nbt_items:
    $execute unless data $(nbt_items_path) run data modify $(nbt_items_path) set value []
    $data modify storage itemio:main.input Items set from $(nbt_items_path)
    scoreboard players add #nb_entities itemio.math.input 1
    
data remove storage itemio:main.input Items[{components:{"minecraft:custom_data":{itemio:{gui:1b}}}}]
data remove storage itemio:main.input input
data modify storage itemio:main.input input set from storage itemio:io input

scoreboard players set #test_side itemio.math.input 0
for facebbbb in ["north","south","east","west","top","bottom"]:
    execute 
        if score #nbt_items itemio.math.input matches 1
        if score #nb_entities itemio.math.input matches 1 
        if score #test_side itemio.math.input matches 0 
        if data storage itemio:io {input_side: f"{facebbbb}"} 
        run function f"itemio:impl/container/input/custom/input_no_config/loop_ioconfig/{facebbbb}"
    execute 
        if score #nbt_items itemio.math.input matches 0
        if score #test_side itemio.math.input matches 0 
        if data storage itemio:io {input_side: f"{facebbbb}"} 
        run function f"itemio:impl/container/input/custom/input_no_config/loop_ioconfig/{facebbbb}"

execute 
    if score #nbt_items itemio.math.input matches 1
    if score #nb_entities itemio.math.input matches 1 
    if score #test_side itemio.math.input matches 0 
    if data storage itemio:io {input_side:"wireless"} 
    run function itemio:impl/container/input/custom/input_no_config/loop_ioconfig
execute
    if score #nbt_items itemio.math.input matches 0
    if score #test_side itemio.math.input matches 0 
    if data storage itemio:io {input_side:"wireless"} 
    run function itemio:impl/container/input/custom/input_no_config/loop_ioconfig


data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
data modify storage itemio:io output.count set from storage itemio:main.input input.count

execute store result score #count_input itemio.math.input run data get storage itemio:io input.count
execute store result score #count_output itemio.math.input run data get storage itemio:io output.count

scoreboard players set #count_to_remove itemio.math.input 0
scoreboard players operation #count_to_remove itemio.math.input = #count_input itemio.math.input
scoreboard players operation #count_to_remove itemio.math.input -= #count_output itemio.math.input

scoreboard players operation #count_to_remove itemio.io = #count_to_remove itemio.math.input


