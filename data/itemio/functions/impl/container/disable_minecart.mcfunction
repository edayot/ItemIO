tag @s add itemio.minecart_disabled
data modify entity @s Enabled set value 0b
data modify entity @s Glowing set value 1b
execute positioned ~ ~1 ~ unless entity @e[type=#itemio:container,tag=itemio.container.initialised,distance=..1] run function itemio:impl/container/enable_minecart

