
# slots[0] : the next slot config usable from the input side
data modify storage itemio:main.input slot set from storage itemio:main.input slots[0]
data remove storage itemio:main.input slots[0]

scoreboard players set #slot_valid itemio.math.input 1
execute if data storage itemio:main.input slot.filters[0] run function itemio:impl/container/input/custom/input_no_config/check_filters
execute if score #slot_valid itemio.math.input matches 1 run function itemio:impl/container/input/custom/input_no_config/process_slot

execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.count
execute if score #count_input itemio.math.input matches 1.. if data storage itemio:main.input slots[0] run function itemio:impl/container/input/custom/input_no_config/loop
