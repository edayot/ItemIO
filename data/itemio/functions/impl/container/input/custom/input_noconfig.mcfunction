



#loading block data
data remove storage itemio:main.input Items
data modify storage itemio:main.input Items set from block ~ ~ ~ Items
data remove storage itemio:main.input Items[{tag:{itemio:{gui:1b}}}]
data remove storage itemio:main.input input
data modify storage itemio:main.input input set from storage itemio:io input

data remove storage itemio:main.input temp.args_loop_ioconfig
data modify storage itemio:main.input temp.args_loop_ioconfig.input_side set from storage itemio:io input_side
execute if data storage itemio:main.input ioconfig[0] run function itemio:impl/container/input/custom/input_no_config/loop_ioconfig with storage itemio:main.input temp.args_loop_ioconfig

data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
data modify storage itemio:io output.Count set from storage itemio:main.input input.Count

execute store result score #count_input itemio.math.input run data get storage itemio:io input.Count
execute store result score #count_output itemio.math.input run data get storage itemio:io output.Count

scoreboard players set #count_to_remove itemio.math.input 0
scoreboard players operation #count_to_remove itemio.math.input = #count_input itemio.math.input
scoreboard players operation #count_to_remove itemio.math.input -= #count_output itemio.math.input

scoreboard players operation #count_to_remove itemio.io = #count_to_remove itemio.math.input


