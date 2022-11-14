execute positioned ~ ~-1 ~ if block ~ ~ ~ hopper[enabled=true] run function itemio:v0.0.1/container/hopper_v2/main

execute positioned ~ ~1 ~ if block ~ ~ ~ hopper[facing=down,enabled=true] run function itemio:v0.0.1/container/hopper_v2/insert_bottom
execute positioned ~ ~ ~1 if block ~ ~ ~ hopper[facing=north,enabled=true] run function itemio:v0.0.1/container/hopper_v2/insert_north
execute positioned ~ ~ ~-1 if block ~ ~ ~ hopper[facing=south,enabled=true] run function itemio:v0.0.1/container/hopper_v2/insert_south
execute positioned ~-1 ~ ~ if block ~ ~ ~ hopper[facing=east,enabled=true] run function itemio:v0.0.1/container/hopper_v2/insert_east
execute positioned ~1 ~ ~ if block ~ ~ ~ hopper[facing=west,enabled=true] run function itemio:v0.0.1/container/hopper_v2/insert_west