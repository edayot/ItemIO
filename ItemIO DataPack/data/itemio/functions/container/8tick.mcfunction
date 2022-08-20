execute if entity @s[tag=itemio.container.hopper] run function itemio:container/hopper/main

# Vanilla behavior

execute positioned ~ ~-1 ~ if block ~ ~ ~ hopper[facing=down] positioned ~ ~-1 ~ run function itemio:container/hopper/vanilla_input
execute positioned ~ ~-1 ~ if block ~ ~ ~ hopper[facing=south] positioned ~ ~ ~-1 run function itemio:container/hopper/vanilla_input/south
execute positioned ~ ~-1 ~ if block ~ ~ ~ hopper[facing=north] positioned ~ ~ ~1 run function itemio:container/hopper/vanilla_input/north
execute positioned ~ ~-1 ~ if block ~ ~ ~ hopper[facing=west] positioned ~-1 ~ ~ run function itemio:container/hopper/vanilla_input/west
execute positioned ~ ~-1 ~ if block ~ ~ ~ hopper[facing=east] positioned ~1 ~ ~ run function itemio:container/hopper/vanilla_input/east


execute positioned ~ ~ ~-1 if block ~ ~ ~ hopper[facing=south,enabled=true] run function itemio:container/hopper/vanilla_input
execute positioned ~ ~ ~1 if block ~ ~ ~ hopper[facing=north,enabled=true] run function itemio:container/hopper/vanilla_input
execute positioned ~1 ~ ~ if block ~ ~ ~ hopper[facing=west,enabled=true] run function itemio:container/hopper/vanilla_input
execute positioned ~-1 ~ ~ if block ~ ~ ~ hopper[facing=east,enabled=true] run function itemio:container/hopper/vanilla_input
