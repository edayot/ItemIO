
execute if block ~ ~-1 ~ hopper run data modify block ~ ~-1 ~ TransferCooldown set value 12
execute if block ~ ~1 ~ hopper[facing=down] run data modify block ~ ~1 ~ TransferCooldown set value 12

execute positioned ~ ~-1 ~ as @e[type=hopper_minecart,distance=..1,tag=!itemio.minecart_disabled] run function itemio:container/input/disable_minecart
