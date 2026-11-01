# Limits of networks and servos processed per tick (0 : no limit)
execute if score #max_network_per_tick itemio.math matches 1.. if score #network_in_tick itemio.math >= #max_network_per_tick itemio.math run return fail
execute if score #max_servos_per_tick itemio.math matches 1.. if score #servos_in_tick itemio.math >= #max_servos_per_tick itemio.math run return fail

execute
    if score @s itemio.network_id.low matches 1..
    unless score @s itemio.servo.processed_tick = #global_tick itemio.math
    if score @s itemio.servo.cooldown < #global_tick itemio.math
    run function itemio:impl/servo/working
