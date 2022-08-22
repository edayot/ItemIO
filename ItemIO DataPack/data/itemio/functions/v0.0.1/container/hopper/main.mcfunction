execute positioned ~ ~1 ~ if block ~ ~ ~ hopper[facing=down,enabled=true] run function itemio:v0.0.1/container/hopper/top
execute positioned ~ ~ ~-1 if block ~ ~ ~ hopper[facing=south,enabled=true] run function itemio:v0.0.1/container/hopper/north
execute positioned ~ ~ ~1 if block ~ ~ ~ hopper[facing=north,enabled=true] run function itemio:v0.0.1/container/hopper/south
execute positioned ~1 ~ ~ if block ~ ~ ~ hopper[facing=west,enabled=true] run function itemio:v0.0.1/container/hopper/east
execute positioned ~-1 ~ ~ if block ~ ~ ~ hopper[facing=east,enabled=true] run function itemio:v0.0.1/container/hopper/west

execute positioned ~ ~-1 ~ if block ~ ~ ~ hopper[enabled=true] run function itemio:v0.0.1/container/hopper/bottom
