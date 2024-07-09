# @public

tag @s remove itemio.network
tag @s remove itemio.servo.initialised

execute at @s as @e[type=#itemio:cables,tag=itemio.cable.initialised,distance=..2] at @s run function itemio:impl/cable/update_model
