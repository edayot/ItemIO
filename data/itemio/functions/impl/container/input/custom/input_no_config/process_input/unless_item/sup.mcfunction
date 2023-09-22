execute store result storage itemio:main.input input.Count int 1 run scoreboard players get #full_stack itemio.math.input
data modify block ~ ~ ~ Items append from storage itemio:main.input input

scoreboard players operation #new_count_input itemio.math.input = #count_input itemio.math.input
scoreboard players operation #new_count_input itemio.math.input -= #full_stack itemio.math.input
execute store result storage itemio:main.input input.Count int 1 run scoreboard players get #new_count_input itemio.math.input


