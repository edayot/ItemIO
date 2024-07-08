
execute if score @e[tag=itemio.cable.me,limit=1] itemio.network_id.low matches 1.. run function itemio:impl/cable/init/regen
execute if score @e[tag=itemio.cable.me,limit=1] itemio.network_id.low matches 0 run function itemio:impl/cable/init/copy




