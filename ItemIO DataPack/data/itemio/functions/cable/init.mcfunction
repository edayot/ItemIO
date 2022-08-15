
scoreboard players set @s itemio.network_id.low 0
scoreboard players set @s itemio.network_id.high 0

scoreboard players add #global_network itemio.network_id.low 1
execute if score #global_network itemio.network_id.low matches 2147483647 run scoreboard players add #global_network itemio.network_id.high 1
execute if score #global_network itemio.network_id.low matches 2147483647 run scoreboard players set #global_network itemio.network_id.low 0

scoreboard players operation @s itemio.network_id.low = #global_network itemio.network_id.low
scoreboard players operation @s itemio.network_id.high = #global_network itemio.network_id.high



#Update network if for all cables connected
scoreboard players set #model_final itemio.math 0

execute align xyz positioned ~.5 ~-.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/init/down
execute align xyz positioned ~.5 ~1.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/init/up

execute align xyz positioned ~.5 ~.5 ~-.5 as @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/init/north
execute align xyz positioned ~.5 ~.5 ~1.5 as @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/init/south


execute align xyz positioned ~-.5 ~.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/init/west
execute align xyz positioned ~1.5 ~.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/init/east


#handeling custom model data
scoreboard players set @s itemio.math 0
scoreboard players operation @s itemio.math = #model_final itemio.math

#Update others network parts like servo
execute align xyz positioned ~.5 ~.5 ~.5 as @e[type=#itemio:cables,tag=itemio.network,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/init_3
