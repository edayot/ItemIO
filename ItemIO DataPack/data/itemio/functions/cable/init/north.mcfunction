scoreboard players add #model_final itemio.math 4
scoreboard players add @s itemio.math 8
function #itemio:event/cable_update

execute if score @e[tag=itemio.cable.me,limit=1] itemio.network_id.low matches 1.. run function itemio:cable/init/regen
execute if score @e[tag=itemio.cable.me,limit=1] itemio.network_id.low matches 0 run function itemio:cable/init/copy

