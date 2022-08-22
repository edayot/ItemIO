execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.Count

scoreboard players set #full_stack itemio.math.input 64
data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage itemio:main.input input.id
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack16 run scoreboard players set #full_stack itemio.math.input 16
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack1 run scoreboard players set #full_stack itemio.math.input 1

execute if score #count_input itemio.math.input > #full_stack itemio.math.input store result storage itemio:main.input input.Count int 1 run scoreboard players get #full_stack itemio.math.input

execute in minecraft:overworld run function itemio:v0.0.1/container/input/vanilla/3/try_input/side/unless_item_dimension
data modify block ~ ~ ~ Items set from storage itemio:main.input Items

execute if score #valid_item itemio.math.input matches 1 run scoreboard players set #success_input itemio.math.input 1
execute if score #valid_item itemio.math.input matches 1 if score #count_input itemio.math.input > #full_stack itemio.math.input run scoreboard players operation #count_input itemio.math.input -= #full_stack itemio.math.input
execute if score #valid_item itemio.math.input matches 1 if score #count_input itemio.math.input <= #full_stack itemio.math.input run scoreboard players set #count_input itemio.math.input 0
execute if score #valid_item itemio.math.input matches 1 if score #count_input itemio.math.input <= #full_stack itemio.math.input run scoreboard players set #full_input itemio.math.input 1


execute if score #valid_item itemio.math.input matches 1 store result storage itemio:main.input input.Count int 1 run scoreboard players get #count_input itemio.math.input



