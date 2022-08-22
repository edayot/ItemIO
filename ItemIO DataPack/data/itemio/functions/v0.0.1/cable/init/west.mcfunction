scoreboard players add #model_final itemio.math 16
scoreboard players add @s itemio.math 32
function #itemio:event/cable_update

execute if score @e[tag=itemio.cable.me,limit=1] itemio.network_id.low matches 1.. run function itemio:v0.0.1/cable/init/regen
execute if score @e[tag=itemio.cable.me,limit=1] itemio.network_id.low matches 0 run function itemio:v0.0.1/cable/init/copy

