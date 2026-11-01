# Right half of a double chest : this one first, then the left half

function itemio:impl/container/input/vanilla/insert

execute if score #remaining itemio.math.input matches 1.. if block ~ ~ ~ #itemio:container/chests[facing=north] positioned ~-1 ~ ~ if block ~ ~ ~ #itemio:container/chests[facing=north,type=left] run function itemio:impl/container/input/vanilla/insert
execute if score #remaining itemio.math.input matches 1.. if block ~ ~ ~ #itemio:container/chests[facing=south] positioned ~1 ~ ~ if block ~ ~ ~ #itemio:container/chests[facing=south,type=left] run function itemio:impl/container/input/vanilla/insert
execute if score #remaining itemio.math.input matches 1.. if block ~ ~ ~ #itemio:container/chests[facing=west] positioned ~ ~ ~1 if block ~ ~ ~ #itemio:container/chests[facing=west,type=left] run function itemio:impl/container/input/vanilla/insert
execute if score #remaining itemio.math.input matches 1.. if block ~ ~ ~ #itemio:container/chests[facing=east] positioned ~ ~ ~-1 if block ~ ~ ~ #itemio:container/chests[facing=east,type=left] run function itemio:impl/container/input/vanilla/insert

function itemio:impl/container/input/vanilla/result
