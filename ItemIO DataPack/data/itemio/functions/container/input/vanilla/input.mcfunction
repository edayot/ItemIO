#init
data remove storage itemio:main.input input
data modify storage itemio:main.input input set from storage itemio:io input
scoreboard players set #full_input itemio.math.input 0


#loading block data
data remove storage itemio:main.input Items
data modify storage itemio:main.input Items set from block ~ ~ ~ Items




execute store result score #input_size itemio.math.input if data storage itemio:main.input Items[]

scoreboard players set #max_iteration itemio.math.input 16
scoreboard players set #no_space itemio.math.input 0
execute if block ~ ~ ~ #itemio:container/27 run function itemio:container/input/vanilla/27/try_input
execute if block ~ ~ ~ #itemio:container/9 run function itemio:container/input/vanilla/9/try_input
execute if block ~ ~ ~ #itemio:container/3 run function itemio:container/input/vanilla/3/try_input
execute if block ~ ~ ~ minecraft:hopper[enabled=true] run function itemio:container/input/vanilla/hopper/try_input

data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
data modify storage itemio:io output.Count set from storage itemio:main.input input.Count

execute store result score #count_input itemio.math.input run data get storage itemio:io input.Count
execute store result score #count_output itemio.math.input run data get storage itemio:io output.Count

scoreboard players set #count_to_remove itemio.math.input 0
scoreboard players operation #count_to_remove itemio.math.input = #count_input itemio.math.input
scoreboard players operation #count_to_remove itemio.math.input -= #count_output itemio.math.input
