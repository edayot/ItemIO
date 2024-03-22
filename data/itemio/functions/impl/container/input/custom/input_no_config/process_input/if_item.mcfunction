$execute store result score #count_container itemio.math.input run data get storage itemio:main.input Items[{Slot:$(Slot)b}].count
execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.count


scoreboard players set #full_stack itemio.math.input 64

data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0] set from storage itemio:main.input input
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 store result score #stack_size itemio.math.input run function itemio:impl/utils/get_stack_size

execute if score #crafter_input itemio.math.input matches 1 run scoreboard players set #full_stack itemio.math.input 1


scoreboard players set #new_count_container itemio.math.input 0
scoreboard players operation #new_count_container itemio.math.input = #count_container itemio.math.input
scoreboard players operation #new_count_container itemio.math.input += #count_input itemio.math.input

execute if score #new_count_container itemio.math.input <= #full_stack itemio.math.input run function itemio:impl/container/input/custom/input_no_config/process_input/if_item/inf/test_nbt with storage itemio:main.input temp.args
execute if score #new_count_container itemio.math.input > #full_stack itemio.math.input if score #count_container itemio.math.input < #full_stack itemio.math.input run function itemio:impl/container/input/custom/input_no_config/process_input/if_item/sup/test_nbt with storage itemio:main.input temp.args