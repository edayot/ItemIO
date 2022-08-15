scoreboard players set @s itemio.network_id.low 0
scoreboard players set @s itemio.network_id.high 0

scoreboard players operation @s itemio.network_id.low = @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] itemio.network_id.low
scoreboard players operation @s itemio.network_id.high = @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] itemio.network_id.high



