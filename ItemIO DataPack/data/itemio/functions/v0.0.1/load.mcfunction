#define storage itemio:main


forceload add -30000000 1600

schedule function itemio:v0.0.1/load_2 2s


gamerule maxCommandChainLength 2147483647
scoreboard objectives add itemio.math dummy
scoreboard objectives add itemio.math.input dummy
scoreboard objectives add itemio.math.output dummy
scoreboard objectives add itemio.network_id.low dummy
scoreboard objectives add itemio.network_id.high dummy

scoreboard objectives add itemio.network.process_queue dummy

scoreboard objectives add itemio.servo.stack_limit dummy
scoreboard objectives add itemio.servo.cooldown dummy

scoreboard players set #process_queue itemio.math 20
scoreboard players set #hopper_speed itemio.math 20

tag AirDox_ add convention.debug


schedule function itemio:v0.0.1/tick 1t replace


