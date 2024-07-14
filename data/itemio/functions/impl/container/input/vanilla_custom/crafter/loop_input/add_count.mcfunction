



# get the count in the crafter at $(Slot)
$scoreboard players set #count_crafter itemio.math.input $(count)
scoreboard players add #count_crafter itemio.math.input 1

# if the new count is 1, an item will appear
execute if score #count_crafter itemio.math.input matches 1 run data modify storage itemio:main.input temp.new_item set from storage itemio:main.input input
$execute if score #count_crafter itemio.math.input matches 1 run data modify storage itemio:main.input temp.new_item.Slot set value $(Slot)b
execute if score #count_crafter itemio.math.input matches 1 run data modify storage itemio:main.input temp.new_item.count set value 1

$execute if score #count_crafter itemio.math.input matches 1 run data remove storage itemio:main.input Items_clean[{Slot:$(Slot)b}]
execute if score #count_crafter itemio.math.input matches 1 run data modify storage itemio:main.input Items_clean append from storage itemio:main.input temp.new_item
execute if score #count_crafter itemio.math.input matches 1 run scoreboard players set #success_input itemio.math.input 1


# if not, just update the count in the storage
$execute unless score #count_crafter itemio.math.input matches 1 if score #count_crafter itemio.math.input <= #full_stack itemio.math.input store result storage itemio:main.input Items_clean[{Slot:$(Slot)b}].count int 1 run scoreboard players get #count_crafter itemio.math.input
execute unless score #count_crafter itemio.math.input matches 1 if score #count_crafter itemio.math.input <= #full_stack itemio.math.input run scoreboard players set #success_input itemio.math.input 1

scoreboard players set #full_input itemio.math.input 0
execute unless score #count_crafter itemio.math.input matches 1 unless score #count_crafter itemio.math.input <= #full_stack itemio.math.input run scoreboard players set #full_input itemio.math.input 1


scoreboard players remove #count_input itemio.math.input 1
data remove storage itemio:main.input Items_min_count[0]
execute 
    if score #count_input itemio.math.input matches 1.. 
    if score #full_input itemio.math.input matches 0
    if data storage itemio:main.input Items_min_count[0] 
    run function itemio:impl/container/input/vanilla_custom/crafter/loop_input/add_count with storage itemio:main.input Items_min_count[0]
