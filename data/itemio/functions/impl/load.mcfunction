#define storage itemio:main
#define storage itemio:main.input
#define storage itemio:main.output






raw gamerule max_command_forks 2147483647
raw gamerule max_command_sequence_length 2147483647

scoreboard objectives add itemio.math dummy
scoreboard players set #0 itemio.math 0
scoreboard players set #1 itemio.math 1
scoreboard players set #2 itemio.math 2
scoreboard players set #4 itemio.math 4
scoreboard players set #8 itemio.math 8
scoreboard players set #16 itemio.math 16
scoreboard players set #32 itemio.math 32
scoreboard players set #64 itemio.math 64
scoreboard players set #128 itemio.math 128
scoreboard players set #256 itemio.math 256

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

scoreboard objectives add itemio.version.major dummy
scoreboard objectives add itemio.version.minor dummy
scoreboard objectives add itemio.version.patch dummy


scoreboard players set #process_queue itemio.math 20
scoreboard players set #hopper_speed itemio.math 8


# Maximum networks processed per tick
# If set to 0, no limit is applied

execute unless score #max_network_per_tick itemio.math matches 0.. run scoreboard players set #max_network_per_tick itemio.math 2
execute unless score #max_servos_per_tick itemio.math matches 0.. run scoreboard players set #max_servos_per_tick itemio.math 128

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
