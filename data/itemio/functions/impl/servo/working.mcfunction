
scoreboard players operation #own_network.low itemio.math = @s itemio.network_id.low
scoreboard players operation #own_network.high itemio.math = @s itemio.network_id.high

execute as @e[type=#itemio:servos,tag=itemio.servo.initialised,predicate=itemio:impl/internal/same_id] run function itemio:impl/servo/add_tags

scoreboard players set #network_as_insert itemio.math 0
execute as @e[type=#itemio:servos,tag=itemio.servo.same_network,tag=itemio.servo.insert,scores={itemio.servo.cooldown=0}] 
    at @s positioned ^ ^ ^-1 
    align xyz 
    positioned ~.5 ~.5 ~.5
    run function itemio:impl/servo/pre_generate_destination



scoreboard players set #servos_transfer itemio.math 1
execute 
    if score #network_as_insert itemio.math matches 1
    as @e[tag=itemio.servo.same_network,tag=itemio.servo.extract] 
    at @s 
    run function itemio:impl/servo/make_transfer
scoreboard players set #servos_transfer itemio.math 0

tag @e[tag=itemio.servo.same_network] remove itemio.servo.same_network
kill @e[tag=itemio.transfer.destination.temp]