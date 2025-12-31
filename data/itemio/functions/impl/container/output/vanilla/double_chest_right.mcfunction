

function itemio:impl/container/output/vanilla/double_chest_moved




execute if score #success_output itemio.io matches 0 if block ~ ~ ~ #itemio:container/chests[facing=north] positioned ~-1 ~ ~ if block ~ ~ ~ #itemio:container/chests[facing=north,type=left] run function itemio:impl/container/output/vanilla/double_chest_moved
execute if score #success_output itemio.io matches 0 if block ~ ~ ~ #itemio:container/chests[facing=south] positioned ~1 ~ ~ if block ~ ~ ~ #itemio:container/chests[facing=south,type=left] run function itemio:impl/container/output/vanilla/double_chest_moved
execute if score #success_output itemio.io matches 0 if block ~ ~ ~ #itemio:container/chests[facing=west] positioned ~ ~ ~1 if block ~ ~ ~ #itemio:container/chests[facing=south,type=left] run function itemio:impl/container/output/vanilla/double_chest_moved
execute if score #success_output itemio.io matches 0 if block ~ ~ ~ #itemio:container/chests[facing=east] positioned ~ ~ ~-1 if block ~ ~ ~ #itemio:container/chests[facing=south,type=left] run function itemio:impl/container/output/vanilla/double_chest_moved
