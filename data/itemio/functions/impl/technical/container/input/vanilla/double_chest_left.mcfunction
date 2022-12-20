

execute if block ~ ~ ~ chest[facing=north] positioned ~1 ~ ~ if block ~ ~ ~ chest[facing=north,type=right] run function itemio:impl/container/input/vanilla/double_chest_left/north
execute if block ~ ~ ~ chest[facing=south] positioned ~-1 ~ ~ if block ~ ~ ~ chest[facing=south,type=right] run function itemio:impl/container/input/vanilla/double_chest_left/south


execute if block ~ ~ ~ chest[facing=west] positioned ~ ~ ~-1 if block ~ ~ ~ chest[facing=west,type=right] run function itemio:impl/container/input/vanilla/double_chest_left/west
execute if block ~ ~ ~ chest[facing=east] positioned ~ ~ ~1 if block ~ ~ ~ chest[facing=east,type=right] run function itemio:impl/container/input/vanilla/double_chest_left/east
