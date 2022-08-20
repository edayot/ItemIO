
#tick container
execute as @e[type=#itemio:container,tag=itemio.container] at @s run function itemio:container/tick
execute as @e[type=hopper_minecart,tag=itemio.minecart_disabled] at @s run function itemio:container/disable_minecart


execute as @e[type=#itemio:item_frames,tag=itemio.servo.extract,predicate=itemio:internal/good_queue] run function itemio:servo/test_already
tag @e[tag=itemio.servo.already] remove itemio.servo.already

execute if score #current_queue itemio.math matches ..0 run scoreboard players operation #current_queue itemio.math = #process_queue itemio.math
scoreboard players remove #current_queue itemio.math 1

execute if score #current_queue_container itemio.math matches ..0 run scoreboard players operation #current_queue_container itemio.math = #hopper_speed itemio.math
scoreboard players remove #current_queue_container itemio.math 1

schedule function itemio:tick 1t replace
