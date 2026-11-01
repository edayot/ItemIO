$execute store result score #count_container itemio.math.input run data get storage itemio:main.input Items[{Slot:$(Slot)b}].count
execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.count

# #full_stack : the stack limit of this slot (process_slot)

scoreboard players set #new_count_container itemio.math.input 0
scoreboard players operation #new_count_container itemio.math.input = #count_container itemio.math.input
scoreboard players operation #new_count_container itemio.math.input += #count_input itemio.math.input

execute if score #new_count_container itemio.math.input <= #full_stack itemio.math.input run function itemio:impl/container/input/custom/input_no_config/process_input/if_item/inf/test_nbt with storage itemio:main.input temp.args
execute if score #new_count_container itemio.math.input > #full_stack itemio.math.input if score #count_container itemio.math.input < #full_stack itemio.math.input run function itemio:impl/container/input/custom/input_no_config/process_input/if_item/sup/test_nbt with storage itemio:main.input temp.args
