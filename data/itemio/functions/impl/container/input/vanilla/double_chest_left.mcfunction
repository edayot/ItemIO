# Left half of a double chest : the right half first, then this one

execute if block ~ ~ ~ #itemio:container/chests[facing=north] positioned ~1 ~ ~ if block ~ ~ ~ #itemio:container/chests[facing=north,type=right] run function itemio:impl/container/input/vanilla/insert
execute if block ~ ~ ~ #itemio:container/chests[facing=south] positioned ~-1 ~ ~ if block ~ ~ ~ #itemio:container/chests[facing=south,type=right] run function itemio:impl/container/input/vanilla/insert
execute if block ~ ~ ~ #itemio:container/chests[facing=west] positioned ~ ~ ~-1 if block ~ ~ ~ #itemio:container/chests[facing=west,type=right] run function itemio:impl/container/input/vanilla/insert
execute if block ~ ~ ~ #itemio:container/chests[facing=east] positioned ~ ~ ~1 if block ~ ~ ~ #itemio:container/chests[facing=east,type=right] run function itemio:impl/container/input/vanilla/insert

execute if score #remaining itemio.math.input matches 1.. run function itemio:impl/container/input/vanilla/insert

function itemio:impl/container/input/vanilla/result
