
scoreboard players operation #own_network.low itemio.math = @s itemio.network_id.low
scoreboard players operation #own_network.high itemio.math = @s itemio.network_id.high

execute as @e[tag=itemio.network,predicate=itemio:internal/same_id] run function itemio:v0.0.1/cable/init/gen