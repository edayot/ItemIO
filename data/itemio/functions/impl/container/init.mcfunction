
execute if score #my_queue itemio.math matches ..0 run scoreboard players operation #my_queue itemio.math = #hopper_speed itemio.math
scoreboard players remove #my_queue itemio.math 1

scoreboard players operation @s itemio.network.process_queue = #my_queue itemio.math

tag @s add itemio.container.initialised
scoreboard players set @s itemio.minecart_check 0

scoreboard players operation @s itemio.version.major = #itemio.major load.status
scoreboard players operation @s itemio.version.minor = #itemio.minor load.status
scoreboard players operation @s itemio.version.patch = #itemio.patch load.status
