

execute if score #max_network_per_tick itemio.math matches 1.. run scoreboard players add #network_in_tick itemio.math 1


scoreboard players operation #own_network.low itemio.math = @s itemio.network_id.low
scoreboard players operation #own_network.high itemio.math = @s itemio.network_id.high

execute
    as @e[type=#itemio:servos,tag=itemio.servo.initialised]
    if score @s itemio.network_id.low = #own_network.low itemio.math
    if score @s itemio.network_id.high = #own_network.high itemio.math
    run function itemio:impl/servo/add_tags

# Each extract servo transfers to the insert servos of the network
scoreboard players set #servos_transfer itemio.math 1
execute
    as @e[type=#itemio:servos,tag=itemio.servo.same_network,tag=itemio.servo.extract]
    if score @s itemio.servo.cooldown < #global_tick itemio.math
    at @s
    run function itemio:impl/servo/make_transfer
scoreboard players set #servos_transfer itemio.math 0

tag @e[type=#itemio:servos,tag=itemio.servo.same_network] remove itemio.servo.same_network
