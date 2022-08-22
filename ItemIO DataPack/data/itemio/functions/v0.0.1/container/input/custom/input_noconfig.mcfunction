

scoreboard players set #full_input itemio.math.input 0


#loading block data
data remove storage itemio:main.input Items
data modify storage itemio:main.input Items set from block ~ ~ ~ Items
data remove storage itemio:main.input Items[{tag:{itemio:{gui:1b}}}]
data remove storage itemio:main.input input
data modify storage itemio:main.input input set from storage itemio:io input

execute if data storage itemio:io {input_side:"top"} if data storage itemio:main.input ioconfig[0] run function itemio:v0.0.1/container/input/custom/try_input/top
execute if data storage itemio:io {input_side:"bottom"} if data storage itemio:main.input ioconfig[0] run function itemio:v0.0.1/container/input/custom/try_input/bottom
execute if data storage itemio:io {input_side:"north"} if data storage itemio:main.input ioconfig[0] run function itemio:v0.0.1/container/input/custom/try_input/north
execute if data storage itemio:io {input_side:"south"} if data storage itemio:main.input ioconfig[0] run function itemio:v0.0.1/container/input/custom/try_input/south
execute if data storage itemio:io {input_side:"east"} if data storage itemio:main.input ioconfig[0] run function itemio:v0.0.1/container/input/custom/try_input/east
execute if data storage itemio:io {input_side:"west"} if data storage itemio:main.input ioconfig[0] run function itemio:v0.0.1/container/input/custom/try_input/west
execute if data storage itemio:io {input_side:"wireless"} if data storage itemio:main.input ioconfig[0] run function itemio:v0.0.1/container/input/custom/try_input

data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
data modify storage itemio:io output.Count set from storage itemio:main.input input.Count

execute store result score #count_input itemio.math.input run data get storage itemio:io input.Count
execute store result score #count_output itemio.math.input run data get storage itemio:io output.Count

scoreboard players set #count_to_remove itemio.math.input 0
scoreboard players operation #count_to_remove itemio.math.input = #count_input itemio.math.input
scoreboard players operation #count_to_remove itemio.math.input -= #count_output itemio.math.input
