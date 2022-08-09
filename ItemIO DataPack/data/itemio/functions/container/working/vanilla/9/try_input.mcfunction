scoreboard players remove #max_iteration itemio.math 1
data modify storage itemio:main Items set from block ~ ~ ~ Items
execute store result score #input_size itemio.math if data storage itemio:main Items[]

execute if score #input_size itemio.math matches ..8 run function itemio:container/working/vanilla/9/inf_insert
execute if score #input_size itemio.math matches 9 run function itemio:container/working/vanilla/9/sup_insert

execute if score #full_input itemio.math matches 0 if score #max_iteration itemio.math matches 1.. run function itemio:container/working/vanilla/9/try_input