scoreboard players remove #max_iteration itemio.math 1
data modify storage itemio:main.input Items set from block ~ ~ ~ Items
execute store result score #input_size itemio.math if data storage itemio:main.input Items[]

execute if score #input_size itemio.math matches ..4 run function itemio:container/input/vanilla/hopper/inf_insert
execute if score #input_size itemio.math matches 5 run function itemio:container/input/vanilla/hopper/sup_insert

execute if score #full_input itemio.math matches 0 if score #max_iteration itemio.math matches 1.. run function itemio:container/input/vanilla/hopper/try_input
