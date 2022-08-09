#init
data modify storage itemio:main input set from storage itemio:io input
scoreboard players set #success_input itemio.math 0
scoreboard players set #full_input itemio.math 0


#loading block data
data remove storage itemio:main Items
data modify storage itemio:main Items set from block ~ ~ ~ Items




execute store result score #input_size itemio.math if data storage itemio:main Items[]

scoreboard players set #max_iteration itemio.math 16
scoreboard players set #no_space itemio.math 0
execute if block ~ ~ ~ #itemio:container/27 run function itemio:container/working/vanilla/27/try_input
execute if block ~ ~ ~ #itemio:container/9 run function itemio:container/working/vanilla/9/try_input
execute if block ~ ~ ~ #itemio:container/3 run function itemio:container/working/vanilla/3/try_input

data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
data modify storage itemio:io output.Count set from storage itemio:main input.Count

