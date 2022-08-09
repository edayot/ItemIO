execute store result storage itemio:main Items[{Slot:12b}].Count byte 1 run scoreboard players get #full_stack itemio.math
execute store result block ~ ~ ~ Items[{Slot:12b}].Count byte 1 run scoreboard players get #full_stack itemio.math

scoreboard players set #new_count_input itemio.math 0
scoreboard players operation #new_count_input itemio.math = #new_count_container itemio.math
scoreboard players operation #new_count_input itemio.math -= #full_stack itemio.math
execute store result storage itemio:main input.Count int 1 run scoreboard players get #new_count_input itemio.math

scoreboard players set #success_input itemio.math 1
scoreboard players set #full_input itemio.math 0

