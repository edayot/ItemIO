



scoreboard players set #network_in_tick itemio.math 0
scoreboard players set #servos_in_tick itemio.math 0


execute as @e[type=#itemio:servos,tag=itemio.servo.extract,tag=itemio.servo.initialised,predicate=itemio:impl/internal/good_queue,sort=random] run function itemio:impl/servo/test_already
tag @e[type=#itemio:servos,tag=itemio.servo.already] remove itemio.servo.already

scoreboard players remove @e[type=#itemio:servos,tag=itemio.servo.initialised,scores={itemio.servo.cooldown=1..}] itemio.servo.cooldown 1

execute if score #current_queue itemio.math matches ..0 run scoreboard players operation #current_queue itemio.math = #process_queue itemio.math
scoreboard players remove #current_queue itemio.math 1

execute if score #current_queue_container itemio.math matches ..0 run scoreboard players operation #current_queue_container itemio.math = #hopper_speed itemio.math
scoreboard players remove #current_queue_container itemio.math 1
