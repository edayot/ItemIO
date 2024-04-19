
# first compute the min of count in the storage itemio:main.input Items_clean list

data remove storage itemio:main.input Items_clean_copy
data modify storage itemio:main.input Items_clean_copy set from storage itemio:main.input Items_clean



execute store result score #min_count itemio.math.input run data get storage itemio:main.input Items_clean_copy[0].count
data remove storage itemio:main.input Items_clean_copy[0]
execute if data storage itemio:main.input Items_clean_copy[0] run function itemio:impl/container/input/vanilla_custom/crafter/loop_input/compute_min



execute store result storage itemio:main.input args_count.count int 1 run scoreboard players get #min_count itemio.math.input

function itemio:impl/container/input/vanilla_custom/crafter/loop_input/get_min_list with storage itemio:main.input args_count

# modify the Items_clean list by adding 1 to every min_count (if applayable)
execute 
    if score #count_input itemio.math.input matches 1.. 
    if data storage itemio:main.input Items_min_count[0] 
    run function itemio:impl/container/input/vanilla_custom/crafter/loop_input/add_count with storage itemio:main.input Items_min_count[0]


scoreboard players remove #max_iteration itemio.math.input 1
execute 
    if score #count_input itemio.math.input matches 1.. 
    if score #max_iteration itemio.math.input matches 1..
    if score #full_input itemio.math.input matches 0
    run function itemio:impl/container/input/vanilla_custom/crafter/loop_input
