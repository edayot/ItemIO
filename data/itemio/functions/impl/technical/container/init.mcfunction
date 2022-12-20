execute if score #my_queue itemio.math matches ..0 run scoreboard players operation #my_queue itemio.math = #hopper_speed itemio.math
scoreboard players remove #my_queue itemio.math 1

scoreboard players operation @s itemio.network.process_queue = #my_queue itemio.math

tag @s add itemio.container.initialised
