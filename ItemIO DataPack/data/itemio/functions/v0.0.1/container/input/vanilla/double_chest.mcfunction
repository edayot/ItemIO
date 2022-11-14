

execute if block ~ ~ ~ chest[facing=north] positioned ~ ~ ~-1 run function itemio:v0.0.1/container/input/vanilla/double_chest/north
execute if block ~ ~ ~ chest[facing=south] positioned ~ ~ ~1 run function itemio:v0.0.1/container/input/vanilla/double_chest/south
execute if block ~ ~ ~ chest[facing=west] positioned ~-1 ~ ~ run function itemio:v0.0.1/container/input/vanilla/double_chest/west
execute if block ~ ~ ~ chest[facing=east] positioned ~1 ~ ~ run function itemio:v0.0.1/container/input/vanilla/double_chest/east
