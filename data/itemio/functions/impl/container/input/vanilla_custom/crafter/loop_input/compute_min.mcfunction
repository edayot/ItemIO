execute store result score #current_count itemio.math.input run data get storage itemio:main.input Items_clean_copy[0].count
execute if score #current_count itemio.math.input < #min_count itemio.math.input run scoreboard players operation #min_count itemio.math.input = #current_count itemio.math.input
data remove storage itemio:main.input Items_clean_copy[0]
execute if data storage itemio:main.input Items_clean_copy[0] run function itemio:impl/container/input/vanilla_custom/crafter/loop_input/compute_min


