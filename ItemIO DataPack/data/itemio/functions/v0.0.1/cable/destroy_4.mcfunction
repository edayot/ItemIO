tag @s add itemio.network.already_regenerated
scoreboard players operation @s itemio.network_id.low = #global_network itemio.network_id.low
scoreboard players operation @s itemio.network_id.high = #global_network itemio.network_id.high

scoreboard players operation @s itemio.network.process_queue = @s itemio.network_id.low
scoreboard players operation @s itemio.network.process_queue %= #process_queue itemio.math
