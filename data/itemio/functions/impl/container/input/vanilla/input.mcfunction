#init
data remove storage itemio:main.input input
data modify storage itemio:main.input input set from storage itemio:io input




execute store result score #input_size itemio.math.input if data storage itemio:main.input Items[]



scoreboard players set #block_size itemio.math.input 0
execute if block ~ ~ ~ #itemio:container/27_chest run scoreboard players set #block_size itemio.math.input 27
execute if block ~ ~ ~ chest[type=single] run scoreboard players set #block_size itemio.math.input 27
execute if block ~ ~ ~ trapped_chest[type=single] run scoreboard players set #block_size itemio.math.input 27

execute if block ~ ~ ~ #itemio:container/9 run scoreboard players set #block_size itemio.math.input 9


execute unless score #block_size itemio.math.input matches 0 run function itemio:impl/container/input/vanilla/try_input


execute if block ~ ~ ~ chest[type=left] run function itemio:impl/container/input/vanilla/double_chest_left
execute if block ~ ~ ~ trapped_chest[type=left] run function itemio:impl/container/input/vanilla/double_chest_left

execute if block ~ ~ ~ chest[type=right] run function itemio:impl/container/input/vanilla/double_chest_right
execute if block ~ ~ ~ trapped_chest[type=right] run function itemio:impl/container/input/vanilla/double_chest_right





data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
data modify storage itemio:io output.Count set from storage itemio:main.input input.Count

execute store result score #count_input itemio.math.input run data get storage itemio:io input.Count
execute store result score #count_output itemio.math.input run data get storage itemio:io output.Count

scoreboard players set #count_to_remove itemio.math.input 0
scoreboard players operation #count_to_remove itemio.math.input = #count_input itemio.math.input
scoreboard players operation #count_to_remove itemio.math.input -= #count_output itemio.math.input

scoreboard players operation #count_to_remove itemio.io = #count_to_remove itemio.math.input

