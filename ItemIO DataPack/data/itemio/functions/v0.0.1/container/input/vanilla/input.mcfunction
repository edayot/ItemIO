#init
data remove storage itemio:main.input input
data modify storage itemio:main.input input set from storage itemio:io input
scoreboard players set #full_input itemio.math.input 0


#loading block data
data remove storage itemio:main.input Items
data modify storage itemio:main.input Items set from block ~ ~ ~ Items
data remove storage itemio:main.input Items[{tag:{itemio:{gui:1b}}}]
data remove storage itemio:main.input Items[{tag:{simplenergy:{texture_item:1b}}}]



execute store result score #input_size itemio.math.input if data storage itemio:main.input Items[]

scoreboard players set #max_iteration itemio.math.input 128
scoreboard players set #no_space itemio.math.input 0
execute if block ~ ~ ~ #itemio:container/27_chest run function itemio:v0.0.1/container/input/vanilla/27/try_input

execute if block ~ ~ ~ chest[type=single] run function itemio:v0.0.1/container/input/vanilla/27/try_input
execute if block ~ ~ ~ trapped_chest[type=single] run function itemio:v0.0.1/container/input/vanilla/27/try_input

execute if block ~ ~ ~ chest[type=right] run function itemio:v0.0.1/container/input/vanilla/double_chest_right
execute if block ~ ~ ~ trapped_chest[type=right] run function itemio:v0.0.1/container/inpu/vanilla/double_chest_right


execute if block ~ ~ ~ chest[type=left] run function itemio:v0.0.1/container/input/vanilla/double_chest_left
execute if block ~ ~ ~ trapped_chest[type=left] run function itemio:v0.0.1/container/input/vanilla/double_chest_left

execute if block ~ ~ ~ #itemio:container/9 run function itemio:v0.0.1/container/input/vanilla/9/try_input
execute if block ~ ~ ~ #itemio:container/3 run function itemio:v0.0.1/container/input/vanilla/3/try_input
execute if block ~ ~ ~ minecraft:hopper[enabled=true] run function itemio:v0.0.1/container/input/vanilla/hopper/try_input

data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
data modify storage itemio:io output.Count set from storage itemio:main.input input.Count

execute store result score #count_input itemio.math.input run data get storage itemio:io input.Count
execute store result score #count_output itemio.math.input run data get storage itemio:io output.Count

scoreboard players set #count_to_remove itemio.math.input 0
scoreboard players operation #count_to_remove itemio.math.input = #count_input itemio.math.input
scoreboard players operation #count_to_remove itemio.math.input -= #count_output itemio.math.input
