scoreboard players remove @s itemio.math 16

scoreboard players add #global_network itemio.network_id.low 1
execute if score #global_network itemio.network_id.low matches 2147483647 run scoreboard players add #global_network itemio.network_id.high 1
execute if score #global_network itemio.network_id.low matches 2147483647 run scoreboard players set #global_network itemio.network_id.low 0

function itemio:cable/destroy_3