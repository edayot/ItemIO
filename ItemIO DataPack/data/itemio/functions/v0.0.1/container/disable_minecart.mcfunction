tag @s add itemio.minecart_disabled
data modify entity @s Enabled set value 0b
execute positioned ~ ~1 ~ unless entity @e[type=marker,tag=itemio.container,distance=..1] run function itemio:v0.0.1/container/disable_minecart