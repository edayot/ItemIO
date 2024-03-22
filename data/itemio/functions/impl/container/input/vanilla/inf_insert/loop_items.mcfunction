

data modify storage itemio:main.input input_to_add set from storage itemio:main.input input
execute store result storage itemio:main.input input_to_add.Slot int 1 run scoreboard players get #temp_slot itemio.math.input

execute if score #loop_count_input itemio.math.input >= #full_stack itemio.math.input store result storage itemio:main.input input_to_add.Count int 1 run scoreboard players get #full_stack itemio.math.input
execute unless score #loop_count_input itemio.math.input >= #full_stack itemio.math.input store result storage itemio:main.input input_to_add.Count int 1 run scoreboard players get #loop_count_input itemio.math.input

data modify storage itemio:main.input inputs append from storage itemio:main.input input_to_add


scoreboard players add #temp_slot itemio.math.input 1
scoreboard players operation #loop_count_input itemio.math.input -= #full_stack itemio.math.input
execute if score #loop_count_input itemio.math.input matches 1.. run function itemio:impl/container/input/vanilla/inf_insert/loop_items




