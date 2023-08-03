


scoreboard players set #loop_count_input itemio.math.input 0
scoreboard players operation #loop_count_input itemio.math.input = #count_input itemio.math.input
data modify storage itemio:main.input inputs set value []
scoreboard players set #temp_slot itemio.math.input 0
execute if score #loop_count_input itemio.math.input matches 1.. run function itemio:impl/container/input/vanilla/inf_insert/loop_items





execute in minecraft:overworld run function itemio:impl/container/input/vanilla/inf_insert/dimension
data modify block ~ ~ ~ Items set from storage itemio:main.input Items


scoreboard players set #success_input itemio.io 1
scoreboard players set #temp_success itemio.math.input 0
execute if score #count_input itemio.math.input > #full_stack itemio.math.input run scoreboard players set #temp_success itemio.math.input 1
execute if score #temp_success itemio.math.input matches 1 run scoreboard players operation #count_input itemio.math.input -= #full_stack itemio.math.input
execute if score #temp_success itemio.math.input matches 0 run scoreboard players set #count_input itemio.math.input 0
execute if score #temp_success itemio.math.input matches 0 run scoreboard players set #full_input itemio.math.input 1


execute store result storage itemio:main.input input.Count int 1 run scoreboard players get #count_input itemio.math.input


#tellraw @a [{"text":"#count_input : "},{"score":{"name":"#count_input","objective":"itemio.math.input"}}]
