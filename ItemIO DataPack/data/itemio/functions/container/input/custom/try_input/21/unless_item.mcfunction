


scoreboard players set #success_input itemio.math 1

scoreboard players set #full_stack itemio.math 64

data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage itemio:main input.id
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack16 run scoreboard players set #full_stack itemio.math 16
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack1 run scoreboard players set #full_stack itemio.math 1

data modify storage itemio:main input.Slot set value 21b

execute store result score #count_input itemio.math run data get storage itemio:main input.Count

scoreboard players set #new_count_input itemio.math 0
execute if score #count_input itemio.math <= #full_stack itemio.math run data modify block ~ ~ ~ Items append from storage itemio:main input
execute if score #count_input itemio.math <= #full_stack itemio.math run scoreboard players set #full_input itemio.math 1
execute if score #count_input itemio.math <= #full_stack itemio.math run data modify storage itemio:main input.Count set value 0b
execute if score #count_input itemio.math > #full_stack itemio.math run scoreboard players set #full_input itemio.math 0
execute if score #count_input itemio.math > #full_stack itemio.math run scoreboard players operation #new_count_input itemio.math = #count_input itemio.math
execute if score #count_input itemio.math > #full_stack itemio.math run scoreboard players operation #new_count_input itemio.math -= #full_stack itemio.math
execute if score #count_input itemio.math > #full_stack itemio.math store result storage itemio:main input.Count int 1 run scoreboard players get #new_count_input itemio.math
execute if score #count_input itemio.math > #full_stack itemio.math run data modify block ~ ~ ~ Items append from storage itemio:main input


