



execute align xyz positioned ~.5 ~-.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/destroy/down
execute align xyz positioned ~.5 ~1.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/destroy/up

execute align xyz positioned ~.5 ~.5 ~-.5 as @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/destroy/north
execute align xyz positioned ~.5 ~.5 ~1.5 as @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/destroy/south


execute align xyz positioned ~-.5 ~.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/destroy/west
execute align xyz positioned ~1.5 ~.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/destroy/east

tag @e[tag=itemio.network.already_regenerated] remove itemio.network.already_regenerated


scoreboard players set @e[type=#itemio:cables,tag=itemio.network,distance=..0.5,sort=nearest] itemio.network_id.low 0
scoreboard players set @e[type=#itemio:cables,tag=itemio.network,distance=..0.5,sort=nearest] itemio.network_id.high 0

