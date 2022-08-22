execute store result score #count_container itemio.math.input run data get storage itemio:main.input Items[{Slot:4b}].Count
execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.Count


scoreboard players set #full_stack itemio.math.input 64

data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage itemio:main.input input.id
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack16 run scoreboard players set #full_stack itemio.math.input 16
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack1 run scoreboard players set #full_stack itemio.math.input 1

scoreboard players set #new_count_container itemio.math.input 0
scoreboard players operation #new_count_container itemio.math.input = #count_container itemio.math.input
scoreboard players operation #new_count_container itemio.math.input += #count_input itemio.math.input

execute if score #new_count_container itemio.math.input <= #full_stack itemio.math.input run function itemio:v0.0.1/container/input/custom/try_input/4/if_item/inf/test_nbt
execute if score #new_count_container itemio.math.input > #full_stack itemio.math.input if score #count_container itemio.math.input < #full_stack itemio.math.input run function itemio:v0.0.1/container/input/custom/try_input/4/if_item/sup/test_nbt
