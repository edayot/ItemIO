



execute align xyz positioned ~.5 ~-.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,tag=!itemio.network.already_regenerated,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/destroy/down
execute align xyz positioned ~.5 ~1.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,tag=!itemio.network.already_regenerated,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/destroy/up

execute align xyz positioned ~.5 ~.5 ~-.5 as @e[type=#itemio:cables,tag=itemio.cable,tag=!itemio.network.already_regenerated,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/destroy/north
execute align xyz positioned ~.5 ~.5 ~1.5 as @e[type=#itemio:cables,tag=itemio.cable,tag=!itemio.network.already_regenerated,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/destroy/south


execute align xyz positioned ~-.5 ~.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,tag=!itemio.network.already_regenerated,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/destroy/west
execute align xyz positioned ~1.5 ~.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable,tag=!itemio.network.already_regenerated,distance=..0.5,limit=1,sort=nearest] run function itemio:cable/destroy/east

tag @e[tag=itemio.network.already_regenerated] remove itemio.network.already_regenerated