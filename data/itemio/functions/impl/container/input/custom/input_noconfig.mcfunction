
for facebbbb in ["north","south","east","west","top","bottom"]:
    name = "itemio:impl/container/input/custom/input_no_config/loop_ioconfig/"+facebbbb
    function name:
        scoreboard players set #test_side itemio.math.input 1
        raw f"execute if data storage itemio:main.input ioconfig[0].allowed_side{{{facebbbb}:1b}} run function itemio:impl/container/input/custom/input_no_config/check_filters"
        data remove storage itemio:main.input ioconfig[0]
        execute unless function itemio:impl/container/input/if_item_input if data storage itemio:main.input ioconfig[0] run function name

function itemio:impl/container/input/custom/input_no_config/loop_ioconfig:
    scoreboard players set #test_side itemio.math.input 1
    function itemio:impl/container/input/custom/input_no_config/check_filters
    data remove storage itemio:main.input ioconfig[0]
    execute unless function itemio:impl/container/input/if_item_input if data storage itemio:main.input ioconfig[0] run function itemio:impl/container/input/custom/input_no_config/loop_ioconfig 


#loading block data
data remove storage itemio:main.input Items
data modify storage itemio:main.input Items set from block ~ ~ ~ Items
data remove storage itemio:main.input Items[{tag:{itemio:{gui:1b}}}]
data remove storage itemio:main.input input
data modify storage itemio:main.input input set from storage itemio:io input

scoreboard players set #test_side itemio.math.input 0
for facebbbb in ["north","south","east","west","top","bottom"]:
    raw f"execute if score #test_side itemio.math.input matches 0 if data storage itemio:io {{input_side: \"{facebbbb}\"}} run function itemio:impl/container/input/custom/input_no_config/loop_ioconfig/{facebbbb}"

execute if score #test_side itemio.math.input matches 0 if data storage itemio:io {input_side:"wireless"} run function itemio:impl/container/input/custom/input_no_config/loop_ioconfig


data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
data modify storage itemio:io output.Count set from storage itemio:main.input input.Count

execute store result score #count_input itemio.math.input run data get storage itemio:io input.Count
execute store result score #count_output itemio.math.input run data get storage itemio:io output.Count

scoreboard players set #count_to_remove itemio.math.input 0
scoreboard players operation #count_to_remove itemio.math.input = #count_input itemio.math.input
scoreboard players operation #count_to_remove itemio.math.input -= #count_output itemio.math.input

scoreboard players operation #count_to_remove itemio.io = #count_to_remove itemio.math.input


