
#loading block data
data remove storage itemio:main.input Items
data modify storage itemio:main.input Items set from block ~ ~ ~ Items
data remove storage itemio:main.input Items[{tag:{itemio:{gui:1b}}}]
data remove storage itemio:main.input Items[{tag:{simplenergy:{texture_item:1b}}}]


function itemio:v0.0.1/container/input/vanilla/27/try_input


#loading block data
execute if score #success_input itemio.math.input matches 0 run data remove storage itemio:main.input Items
execute if score #success_input itemio.math.input matches 0 run data modify storage itemio:main.input Items set from block ~ ~ ~-1 Items
execute if score #success_input itemio.math.input matches 0 run data remove storage itemio:main.input Items[{tag:{itemio:{gui:1b}}}]
execute if score #success_input itemio.math.input matches 0 run data remove storage itemio:main.input Items[{tag:{simplenergy:{texture_item:1b}}}]

execute if score #success_input itemio.math.input matches 0 positioned ~ ~ ~-1 run function itemio:v0.0.1/container/input/vanilla/27/try_input