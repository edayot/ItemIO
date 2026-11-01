


scoreboard players set #success_input itemio.io 1

# #full_stack : the stack limit of this slot (process_slot)

$data modify storage itemio:main.input input.Slot set value $(Slot)b

execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.count

scoreboard players set #new_count_input itemio.math.input 0
execute if score #count_input itemio.math.input <= #full_stack itemio.math.input run function itemio:impl/container/input/custom/input_no_config/process_input/unless_item/inf

execute if score #count_input itemio.math.input > #full_stack itemio.math.input run function itemio:impl/container/input/custom/input_no_config/process_input/unless_item/sup
