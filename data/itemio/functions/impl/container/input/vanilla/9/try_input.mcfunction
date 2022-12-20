data remove storage itemio:main.input Items
data modify storage itemio:main.input Items set from block ~ ~ ~ Items
data remove storage itemio:main.input Items[{tag:{itemio:{gui:1b}}}]
data remove storage itemio:main.input Items[{tag:{simplenergy:{texture_item:1b}}}]

scoreboard players remove #max_iteration itemio.math.input 1
scoreboard players set #input_size itemio.math.input -1
execute store result score #input_size itemio.math.input if data storage itemio:main.input Items[]

execute if score #input_size itemio.math.input matches 0..8 run function itemio:impl/container/input/vanilla/9/inf_insert
execute if score #input_size itemio.math.input matches 9 run function itemio:impl/container/input/vanilla/9/sup_insert

execute if score #full_input itemio.math.input matches 0 if score #max_iteration itemio.math.input matches 1.. run function itemio:impl/container/input/vanilla/9/try_input