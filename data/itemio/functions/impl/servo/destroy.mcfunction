# @public

execute at @s as @e[type=#itemio:cables,tag=itemio.cable.initialised,distance=..0.5001,limit=1,sort=nearest] run function itemio:impl/cable/update_model