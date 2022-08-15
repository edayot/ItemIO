scoreboard players add #global_network itemio.network_id.low 1
execute if score #global_network itemio.network_id.low matches 2147483647 run scoreboard players add #global_network itemio.network_id.high 1
execute if score #global_network itemio.network_id.low matches 2147483647 run scoreboard players set #global_network itemio.network_id.low 0

scoreboard players operation @s itemio.network_id.low = #global_network itemio.network_id.low
scoreboard players operation @s itemio.network_id.high = #global_network itemio.network_id.high

