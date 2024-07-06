
tag @s add itemio.network
tag @s add itemio.servo.initialised
scoreboard players set @s itemio.network_id.low 0
scoreboard players set @s itemio.network_id.high 0

# initial value for scores
scoreboard players set @s itemio.math 0
scoreboard players set @s itemio.servo.cooldown 0
scoreboard players add @s itemio.servo.stack_limit 0
scoreboard players add @s itemio.servo.retry_limit 0

execute unless score @s itemio.servo.stack_limit matches 0.. run scoreboard players set @s itemio.servo.stack_limit 1
execute unless score @s itemio.servo.retry_limit matches 0.. run scoreboard players set @s itemio.servo.retry_limit 1

# copy network id to process queue
execute align xyz positioned ~.5 ~.5 ~.5 run tag @e[type=#itemio:cables,tag=itemio.cable.initialised,distance=..0.5001,limit=1,sort=nearest] add itemio.cable.me

scoreboard players set #if_entity_exist itemio.math 0
execute 
    if entity @e[tag=itemio.cable.me,limit=1] 
    run function ~/if_cable:
        scoreboard players set @s itemio.math 1
        scoreboard players set #if_entity_exist itemio.math 1
        scoreboard players operation @s itemio.network_id.low = @e[tag=itemio.cable.me,limit=1] itemio.network_id.low
        scoreboard players operation @s itemio.network_id.high = @e[tag=itemio.cable.me,limit=1] itemio.network_id.high

        scoreboard players operation @s itemio.network.process_queue = @s itemio.network_id.low
        scoreboard players operation @s itemio.network.process_queue %= #process_queue itemio.math

        scoreboard players operation #model_final itemio.math = @e[tag=itemio.cable.me,limit=1] itemio.math
        function itemio:impl/servo/calc_cable_model
        execute
            as @e[tag=itemio.cable.me,limit=1]
            run function ./reload_model:
                scoreboard players operation @s itemio.math = #model_final itemio.math
                function #itemio:event/cable_update
        

# if not exist any cable then set process queue to -1
execute 
    if score #if_entity_exist itemio.math matches 0
    run function ~/unless_cable:
        scoreboard players set @s itemio.network.process_queue -1






function #itemio:event/network_update
tag @e[tag=itemio.cable.me] remove itemio.cable.me
