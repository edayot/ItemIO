





execute if block ~ ~ ~ #itemio:container/chests[facing=north] positioned ~1 ~ ~ if block ~ ~ ~ #itemio:container/chests[facing=north,type=right] run function itemio:impl/container/output/vanilla/double_chest_moved
execute if block ~ ~ ~ #itemio:container/chests[facing=south] positioned ~-1 ~ ~ if block ~ ~ ~ #itemio:container/chests[facing=south,type=right] run function itemio:impl/container/output/vanilla/double_chest_moved
execute if block ~ ~ ~ #itemio:container/chests[facing=west] positioned ~ ~ ~-1 if block ~ ~ ~ #itemio:container/chests[facing=west,type=right] run function itemio:impl/container/output/vanilla/double_chest_moved
execute if block ~ ~ ~ #itemio:container/chests[facing=east] positioned ~ ~ ~1 if block ~ ~ ~ #itemio:container/chests[facing=east,type=right] run function itemio:impl/container/output/vanilla/double_chest_moved

execute if score #success_output itemio.io matches 0 run function itemio:impl/container/output/vanilla/double_chest_moved
