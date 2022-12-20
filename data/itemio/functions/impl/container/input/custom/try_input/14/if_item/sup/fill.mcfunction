execute store result storage itemio:main.input Items[{Slot:14b}].Count byte 1 run scoreboard players get #full_stack itemio.math.input
execute store result block ~ ~ ~ Items[{Slot:14b}].Count byte 1 run scoreboard players get #full_stack itemio.math.input

scoreboard players set #new_count_input itemio.math.input 0
scoreboard players operation #new_count_input itemio.math.input = #new_count_container itemio.math.input
scoreboard players operation #new_count_input itemio.math.input -= #full_stack itemio.math.input
execute store result storage itemio:main.input input.Count int 1 run scoreboard players get #new_count_input itemio.math.input

scoreboard players set #success_input itemio.math.input 1
scoreboard players set #full_input itemio.math.input 0

