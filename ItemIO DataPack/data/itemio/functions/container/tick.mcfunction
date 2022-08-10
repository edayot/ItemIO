
execute if block ~ ~-1 ~ hopper run function itemio:container/hopper/bottom
execute if block ~ ~1 ~ hopper[facing=down] run function itemio:container/hopper/side

execute positioned ~ ~-1 ~ as @e[type=hopper_minecart,distance=..1,tag=!itemio.minecart_disabled] run function itemio:container/disable_minecart
