

execute if block ~ ~ ~ chest[facing=north] positioned ~ ~ ~-1 run function itemio:v0.0.1/container/input/vanilla/double_chest_left/north
execute if block ~ ~ ~ chest[facing=south] positioned ~ ~ ~1 run function itemio:v0.0.1/container/input/vanilla/double_chest_left/south
execute if block ~ ~ ~ chest[facing=west] positioned ~-1 ~ ~ run function itemio:v0.0.1/container/input/vanilla/double_chest_left/west
execute if block ~ ~ ~ chest[facing=east] positioned ~1 ~ ~ run function itemio:v0.0.1/container/input/vanilla/double_chest_left/east
