data remove storage itemio:main.input Items
data modify storage itemio:main.input Items set from block ~ ~ ~ Items
data remove storage itemio:main.input Items[{tag:{itemio:{gui:1b}}}]
data remove storage itemio:main.input Items[{tag:{simplenergy:{texture_item:1b}}}]

scoreboard players remove #max_iteration itemio.math.input 1
scoreboard players set #input_size itemio.math.input -1
execute store result score #input_size itemio.math.input if data storage itemio:main.input Items[]

#tellraw @a [{"text":"#input_size : "},{"score":{"name":"#input_size","objective":"itemio.math.input"}}]
#tellraw @a [{"text":"current item : "},{"nbt":"input","storage":"itemio:main.input"}]

execute if score #input_size itemio.math.input matches 0..26 run function itemio:impl/container/input/vanilla/27/inf_insert
execute if score #input_size itemio.math.input matches 27 run function itemio:impl/container/input/vanilla/27/sup_insert

execute if score #full_input itemio.math.input matches 0 if score #max_iteration itemio.math.input matches 1.. run function itemio:impl/container/input/vanilla/27/try_input