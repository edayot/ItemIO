
scoreboard players operation #own_network.low itemio.math = @s itemio.network_id.low
scoreboard players operation #own_network.high itemio.math = @s itemio.network_id.high

# the score to change in ./gen
scoreboard players operation #temp_low itemio.math = @e[tag=itemio.cable.me,limit=1] itemio.network_id.low
scoreboard players operation #temp_high itemio.math = @e[tag=itemio.cable.me,limit=1] itemio.network_id.high


execute as @e[type=#itemio:network,tag=itemio.network,predicate=itemio:impl/internal/same_id] run function itemio:impl/cable/init/gen
