# @public
tag @s remove itemio.network
tag @s remove itemio.cable.initialised


execute align xyz positioned ~.5 ~-.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable.initialised,distance=..0.5001,limit=1,sort=nearest] run function itemio:impl/cable/destroy/down
execute align xyz positioned ~.5 ~1.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable.initialised,distance=..0.5001,limit=1,sort=nearest] run function itemio:impl/cable/destroy/up

execute align xyz positioned ~.5 ~.5 ~-.5 as @e[type=#itemio:cables,tag=itemio.cable.initialised,distance=..0.5001,limit=1,sort=nearest] run function itemio:impl/cable/destroy/north
execute align xyz positioned ~.5 ~.5 ~1.5 as @e[type=#itemio:cables,tag=itemio.cable.initialised,distance=..0.5001,limit=1,sort=nearest] run function itemio:impl/cable/destroy/south


execute align xyz positioned ~-.5 ~.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable.initialised,distance=..0.5001,limit=1,sort=nearest] run function itemio:impl/cable/destroy/west
execute align xyz positioned ~1.5 ~.5 ~.5 as @e[type=#itemio:cables,tag=itemio.cable.initialised,distance=..0.5001,limit=1,sort=nearest] run function itemio:impl/cable/destroy/east

tag @e[type=#itemio:cables,tag=itemio.network.already_regenerated] remove itemio.network.already_regenerated


execute 
    as @e[type=#itemio:network,tag=itemio.network,tag=!itemio.cable,distance=..0.5001]
    at @s
    run function itemio:impl/cable/destroy/network:
        scoreboard players set @s itemio.network.process_queue -1
        scoreboard players set @s itemio.network_id.low 0
        scoreboard players set @s itemio.network_id.high 0
        scoreboard players set @s itemio.math 0
        function #itemio:event/network_update


execute as @e[type=#itemio:cables,tag=itemio.cable.initialised,distance=..2] at @s run function itemio:impl/cable/update_model
