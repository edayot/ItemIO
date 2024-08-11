
data remove storage itemio:main.input input
data modify storage itemio:main.input input set from storage itemio:io input


execute store result score #if_item itemio.math.input if data storage itemio:main.input ItemUnique


scoreboard players set #full_stack itemio.math.input 64
data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0] set from storage itemio:main.input input
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 store result score #full_stack itemio.math.input run function itemio:impl/utils/get_stack_size
execute if score #override_stack_size itemio.math.input matches 1 run scoreboard players set #full_stack itemio.math.input 1


execute 
    if score #if_item itemio.math.input matches 1 
    run function ~/if_item:
        execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.count
        execute store result score #count_block itemio.math.input run data get storage itemio:main.input ItemUnique.count

        scoreboard players operation #new_count itemio.math.input = #count_block itemio.math.input
        scoreboard players operation #new_count itemio.math.input += #count_input itemio.math.input

        execute if score #new_count itemio.math.input > #full_stack itemio.math.input run scoreboard players operation #new_count itemio.math.input = #full_stack itemio.math.input

        execute if score #new_count itemio.math.input = #count_block itemio.math.input run return fail


        data remove storage itemio:main.input Item1
        data remove storage itemio:main.input Item2
        data modify storage itemio:main.input Item1 set from storage itemio:main.input ItemUnique
        data modify storage itemio:main.input Item2 set from storage itemio:main.input input
        data remove storage itemio:main.input Item1.count
        data remove storage itemio:main.input Item2.count
        data remove storage itemio:main.input Item1.Slot
        data remove storage itemio:main.input Item2.Slot

        execute store success score #!same_item_single itemio.math.input run data modify storage itemio:main.input Item1 set from storage itemio:main.input Item2
        execute if score #!same_item_single itemio.math.input matches 1 run return fail

        scoreboard players set #success_input itemio.io 1
        scoreboard players operation #new_count_input itemio.math.input = #count_input itemio.math.input
        scoreboard players operation #new_count_input itemio.math.input += #count_block itemio.math.input
        scoreboard players operation #new_count_input itemio.math.input -= #new_count itemio.math.input 

        execute store result storage itemio:main.input input.count int 1 run scoreboard players get #new_count_input itemio.math.input
        execute store result storage itemio:main.input ItemUnique.count int 1 run scoreboard players get #new_count itemio.math.input
execute 
    if score #if_item itemio.math.input matches 0
    run function ~/unless_item:
        execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.count

        scoreboard players operation #new_count itemio.math.input = #count_input itemio.math.input

        execute if score #new_count itemio.math.input > #full_stack itemio.math.input run scoreboard players operation #new_count itemio.math.input = #full_stack itemio.math.input

        scoreboard players set #success_input itemio.io 1
        scoreboard players operation #new_count_input itemio.math.input = #count_input itemio.math.input
        scoreboard players operation #new_count_input itemio.math.input -= #new_count itemio.math.input

        execute store result storage itemio:main.input input.count int 1 run scoreboard players get #new_count_input itemio.math.input
        data remove storage itemio:main.input ItemUnique
        data modify storage itemio:main.input ItemUnique set from storage itemio:main.input input
        execute store result storage itemio:main.input ItemUnique.count int 1 run scoreboard players get #new_count itemio.math.input




data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
data modify storage itemio:io output.count set from storage itemio:main.input input.count

execute store result score #count_input itemio.math.input run data get storage itemio:io input.count
execute store result score #count_output itemio.math.input run data get storage itemio:io output.count

scoreboard players set #count_to_remove itemio.math.input 0
scoreboard players operation #count_to_remove itemio.math.input = #count_input itemio.math.input
scoreboard players operation #count_to_remove itemio.math.input -= #count_output itemio.math.input

scoreboard players operation #count_to_remove itemio.io = #count_to_remove itemio.math.input










