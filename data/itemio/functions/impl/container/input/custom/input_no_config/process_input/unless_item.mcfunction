


scoreboard players set #success_input itemio.io 1

scoreboard players set #full_stack itemio.math.input 64

data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0] set from storage itemio:main.input input
raw execute store result score #full_stack itemio.math.input if items entity 93682a08-d099-4e8f-a4a6-1e33a3692301 weapon *[minecraft:max_stack_size]

execute if score #crafter_input itemio.math.input matches 1 run scoreboard players set #full_stack itemio.math.input 1


$data modify storage itemio:main.input input.Slot set value $(Slot)b

execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.count

scoreboard players set #new_count_input itemio.math.input 0
execute if score #count_input itemio.math.input <= #full_stack itemio.math.input run function itemio:impl/container/input/custom/input_no_config/process_input/unless_item/inf

execute if score #count_input itemio.math.input > #full_stack itemio.math.input run function itemio:impl/container/input/custom/input_no_config/process_input/unless_item/sup


