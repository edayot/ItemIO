
scoreboard players set #success_input itemio.math 0
scoreboard players set #full_input itemio.math 0


#loading block data
data remove storage itemio:main Items
data modify storage itemio:main Items set from block ~ ~ ~ Items
data modify storage itemio:main input set from storage itemio:io input

execute if data storage itemio:io {input_side:"top"} run function itemio:container/input/custom/try_input/top
execute if data storage itemio:io {input_side:"bottom"} run function itemio:container/input/custom/try_input/bottom
execute if data storage itemio:io {input_side:"north"} run function itemio:container/input/custom/try_input/north
execute if data storage itemio:io {input_side:"south"} run function itemio:container/input/custom/try_input/south
execute if data storage itemio:io {input_side:"east"} run function itemio:container/input/custom/try_input/east
execute if data storage itemio:io {input_side:"west"} run function itemio:container/input/custom/try_input/west
execute if data storage itemio:io {input_side:"wireless"} run function itemio:container/input/custom/try_input

data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
data modify storage itemio:io output.Count set from storage itemio:main input.Count

execute store result score #count_input itemio.math run data get storage itemio:io input.Count
execute store result score #count_output itemio.math run data get storage itemio:io output.Count

scoreboard players set #count_to_remove itemio.math 0
scoreboard players operation #count_to_remove itemio.math = #count_input itemio.math
scoreboard players operation #count_to_remove itemio.math -= #count_output itemio.math
