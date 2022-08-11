
execute positioned ~ ~-1 ~ if block ~ ~ ~ hopper run data modify block ~ ~ ~ TransferCooldown set value 12
execute positioned ~ ~1 ~ if block ~ ~ ~ hopper[facing=down] run data modify block ~ ~ ~ TransferCooldown set value 12
execute positioned ~ ~ ~-1 if block ~ ~ ~ hopper[facing=south] run data modify block ~ ~ ~ TransferCooldown set value 12
execute positioned ~ ~ ~1 if block ~ ~ ~ hopper[facing=north] run data modify block ~ ~ ~ TransferCooldown set value 12
execute positioned ~-1 ~ ~ if block ~ ~ ~ hopper[facing=east] run data modify block ~ ~ ~ TransferCooldown set value 12
execute positioned ~1 ~ ~ if block ~ ~ ~ hopper[facing=west] run data modify block ~ ~ ~ TransferCooldown set value 12



execute positioned ~ ~-1 ~ as @e[type=hopper_minecart,distance=..1,tag=!itemio.minecart_disabled] run function itemio:container/disable_minecart
