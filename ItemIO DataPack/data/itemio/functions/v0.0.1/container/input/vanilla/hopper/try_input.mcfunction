scoreboard players remove #max_iteration itemio.math.input 1
data modify storage itemio:main.input Items set from block ~ ~ ~ Items
execute store result score #input_size itemio.math.input if data storage itemio:main.input Items[]

execute if score #input_size itemio.math.input matches ..4 run function itemio:v0.0.1/container/input/vanilla/hopper/inf_insert
execute if score #input_size itemio.math.input matches 5 run function itemio:v0.0.1/container/input/vanilla/hopper/sup_insert

execute if score #full_input itemio.math.input matches 0 if score #max_iteration itemio.math.input matches 1.. run function itemio:v0.0.1/container/input/vanilla/hopper/try_input
