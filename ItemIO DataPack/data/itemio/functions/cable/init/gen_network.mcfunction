scoreboard players operation @s itemio.network_id.low = @e[tag=itemio.cable.me,limit=1] itemio.network_id.low
scoreboard players operation @s itemio.network_id.high = @e[tag=itemio.cable.me,limit=1] itemio.network_id.high
scoreboard players set @s itemio.math 1
function #itemio:event/network_update
