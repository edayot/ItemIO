scoreboard players operation @s itemio.network_id.low = #temp_low itemio.math
scoreboard players operation @s itemio.network_id.high = #temp_high itemio.math

scoreboard players operation @s itemio.network.process_queue = #temp_low itemio.math
scoreboard players operation @s itemio.network.process_queue %= #process_queue itemio.math

scoreboard players set @s itemio.math 1
function #itemio:event/network_update
