#define storage itemio:main






gamerule maxCommandChainLength 2147483647
scoreboard objectives add itemio.math dummy
scoreboard objectives add itemio.io dummy
scoreboard objectives add itemio.math.input dummy
scoreboard objectives add itemio.math.output dummy
scoreboard objectives add itemio.network_id.low dummy
scoreboard objectives add itemio.network_id.high dummy
scoreboard objectives add itemio.minecart_check dummy

scoreboard objectives add itemio.network.process_queue dummy

scoreboard objectives add itemio.servo.stack_limit dummy
scoreboard objectives add itemio.servo.cooldown dummy
scoreboard objectives add itemio.servo.retry_limit dummy


scoreboard players set #process_queue itemio.math 20
scoreboard players set #hopper_speed itemio.math 8

scoreboard players add #my_queue itemio.math 0

#my_queue itemio.math with #hopper_speed itemio.math
execute if score #my_queue itemio.math > #hopper_speed itemio.math run scoreboard players operation #my_queue itemio.math = #hopper_speed itemio.math

#current_queue_container itemio.math with #hopper_speed itemio.math
execute if score #current_queue_container itemio.math > #hopper_speed itemio.math run scoreboard players operation #current_queue_container itemio.math = #hopper_speed itemio.math

#current_queue itemio.math with #process_queue itemio.math
execute if score #current_queue itemio.math > #process_queue itemio.math run scoreboard players operation #current_queue itemio.math = #process_queue itemio.math


tag AirDox_ add convention.debug


schedule function itemio:impl/tick 1t replace

forceload add -30000000 1600
schedule function itemio:impl/load_2 1s replace
