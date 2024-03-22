


scoreboard players set #loop_count_input itemio.math.input 0
scoreboard players operation #loop_count_input itemio.math.input = #count_input itemio.math.input
data modify storage itemio:main.input inputs set value []
scoreboard players set #temp_slot itemio.math.input 0
execute if score #loop_count_input itemio.math.input matches 1.. run function itemio:impl/container/input/vanilla/inf_insert/loop_items





execute in minecraft:overworld run function itemio:impl/container/input/vanilla/inf_insert/dimension
data modify block ~ ~ ~ Items set from storage itemio:main.input Items


scoreboard players set #success_input itemio.io 1


scoreboard players set #count_input itemio.math.input 0

data modify storage itemio:main.input input.count set value 0


#tellraw @a [{"text":"#count_input : "},{"score":{"name":"#count_input","objective":"itemio.math.input"}}]
