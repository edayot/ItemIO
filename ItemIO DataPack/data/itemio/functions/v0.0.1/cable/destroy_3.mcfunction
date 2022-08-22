tag @s add itemio.network.already_regenerated
scoreboard players operation @s itemio.network_id.low = #global_network itemio.network_id.low
scoreboard players operation @s itemio.network_id.high = #global_network itemio.network_id.high


execute align xyz positioned ~.5 ~1.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,tag=!itemio.network.already_regenerated,distance=..0.5,limit=1,sort=nearest] run function itemio:v0.0.1/cable/destroy_3
execute align xyz positioned ~.5 ~-.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,tag=!itemio.network.already_regenerated,distance=..0.5,limit=1,sort=nearest] run function itemio:v0.0.1/cable/destroy_3


execute align xyz positioned ~1.5 ~.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,tag=!itemio.network.already_regenerated,distance=..0.5,limit=1,sort=nearest] run function itemio:v0.0.1/cable/destroy_3
execute align xyz positioned ~-.5 ~.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,tag=!itemio.network.already_regenerated,distance=..0.5,limit=1,sort=nearest] run function itemio:v0.0.1/cable/destroy_3

execute align xyz positioned ~.5 ~.5 ~1.5 as @e[type=#itemio:cables,tag=itemio.cable,tag=!itemio.network.already_regenerated,distance=..0.5,limit=1,sort=nearest] run function itemio:v0.0.1/cable/destroy_3
execute align xyz positioned ~.5 ~.5 ~-.5 as @e[type=#itemio:cables,tag=itemio.cable,tag=!itemio.network.already_regenerated,distance=..0.5,limit=1,sort=nearest] run function itemio:v0.0.1/cable/destroy_3

execute align xyz positioned ~.5 ~.5 ~.5 as @e[type=#itemio:cables,tag=itemio.network,tag=!itemio.network.already_regenerated,distance=..0.5] run function itemio:v0.0.1/cable/destroy_4
