scoreboard players add #model_final itemio.math 8
scoreboard players add @s itemio.math 4


scoreboard players operation #own_network.low itemio.math = @s itemio.network_id.low
scoreboard players operation #own_network.high itemio.math = @s itemio.network_id.high

execute as @e[tag=itemio.network,predicate=itemio:internal/same_id] run function itemio:cable/init_3


