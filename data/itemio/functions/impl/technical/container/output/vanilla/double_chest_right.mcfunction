

function itemio:impl/container/output/vanilla/double_chest_moved




execute if score #success_output itemio.math.output matches 0 if block ~ ~ ~ chest[facing=north] positioned ~-1 ~ ~ if block ~ ~ ~ chest[facing=north,type=left] run function itemio:impl/container/output/vanilla/double_chest_moved
execute if score #success_output itemio.math.output matches 0 if block ~ ~ ~ chest[facing=south] positioned ~1 ~ ~ if block ~ ~ ~ chest[facing=south,type=left] run function itemio:impl/container/output/vanilla/double_chest_moved
execute if score #success_output itemio.math.output matches 0 if block ~ ~ ~ chest[facing=west] positioned ~ ~ ~1 if block ~ ~ ~ chest[facing=south,type=left] run function itemio:impl/container/output/vanilla/double_chest_moved
execute if score #success_output itemio.math.output matches 0 if block ~ ~ ~ chest[facing=east] positioned ~ ~ ~-1 if block ~ ~ ~ chest[facing=south,type=left] run function itemio:impl/container/output/vanilla/double_chest_moved
