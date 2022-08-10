
execute positioned ~ ~-1 ~ if block ~ ~ ~ hopper run function itemio:container/hopper/bottom
execute positioned ~ ~1 ~ if block ~ ~ ~ hopper[facing=down] run function itemio:container/hopper/top
execute positioned ~ ~ ~-1 if block ~ ~ ~ hopper[facing=south] run function itemio:container/hopper/south


execute positioned ~ ~-1 ~ as @e[type=hopper_minecart,distance=..1,tag=!itemio.minecart_disabled] run function itemio:container/disable_minecart
