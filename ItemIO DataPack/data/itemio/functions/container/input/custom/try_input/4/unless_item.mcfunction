


scoreboard players set #success_input itemio.math.input 1

scoreboard players set #full_stack itemio.math.input 64

data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage itemio:main.input input.id
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack16 run scoreboard players set #full_stack itemio.math.input 16
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack1 run scoreboard players set #full_stack itemio.math.input 1

data modify storage itemio:main.input input.Slot set value 4b

execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.Count

scoreboard players set #new_count_input itemio.math.input 0
execute if score #count_input itemio.math.input <= #full_stack itemio.math.input run data modify block ~ ~ ~ Items append from storage itemio:main.input input
execute if score #count_input itemio.math.input <= #full_stack itemio.math.input run scoreboard players set #full_input itemio.math.input 1
execute if score #count_input itemio.math.input <= #full_stack itemio.math.input run data modify storage itemio:main.input input.Count set value 0b
execute if score #count_input itemio.math.input > #full_stack itemio.math.input run scoreboard players set #full_input itemio.math.input 0
execute if score #count_input itemio.math.input > #full_stack itemio.math.input run scoreboard players operation #new_count_input itemio.math.input = #count_input itemio.math.input
execute if score #count_input itemio.math.input > #full_stack itemio.math.input run scoreboard players operation #new_count_input itemio.math.input -= #full_stack itemio.math.input
execute if score #count_input itemio.math.input > #full_stack itemio.math.input store result storage itemio:main.input input.Count int 1 run scoreboard players get #new_count_input itemio.math.input
execute if score #count_input itemio.math.input > #full_stack itemio.math.input run data modify block ~ ~ ~ Items append from storage itemio:main.input input


