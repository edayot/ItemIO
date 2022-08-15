
scoreboard players operation #own_network.low itemio.math = @s itemio.network_id.low
scoreboard players operation #own_network.high itemio.math = @s itemio.network_id.high

execute as @e[tag=itemio.servo,predicate=itemio:internal/same_id] run function itemio:servo/add_tags

execute as @e[tag=itemio.servo.same_network,tag=itemio.servo.input] at @s run function itemio:servo/generate_destination

execute as @e[tag=itemio.servo.same_network,tag=itemio.servo.output] at @s run function itemio:servo/make_transfer

tag @e[tag=itemio.servo.same_network] remove itemio.servo.same_network
kill @e[tag=itemio.transfer.destination.temp]