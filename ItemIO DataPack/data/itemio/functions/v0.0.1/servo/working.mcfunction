
scoreboard players operation #own_network.low itemio.math = @s itemio.network_id.low
scoreboard players operation #own_network.high itemio.math = @s itemio.network_id.high

execute as @e[tag=itemio.servo,predicate=itemio:internal/same_id] run function itemio:v0.0.1/servo/add_tags

execute as @e[tag=itemio.servo.same_network,tag=itemio.servo.insert,scores={itemio.servo.cooldown=0}] at @s run function itemio:v0.0.1/servo/generate_destination

scoreboard players set #servos_transfer itemio.math 1
execute if entity @e[tag=itemio.transfer.destination.temp] as @e[tag=itemio.servo.same_network,tag=itemio.servo.extract] at @s run function itemio:v0.0.1/servo/make_transfer
scoreboard players set #servos_transfer itemio.math 0

tag @e[tag=itemio.servo.same_network] remove itemio.servo.same_network
kill @e[tag=itemio.transfer.destination.temp]