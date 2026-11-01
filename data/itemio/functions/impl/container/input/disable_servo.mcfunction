# @public
# The servos around this position wait before their next transfer

execute as @e[type=#itemio:servos,tag=itemio.servo.initialised,distance=..1.5] run function ~/random_cooldown:
    execute store result score @s itemio.servo.cooldown run random value 75..200
    scoreboard players operation @s itemio.servo.cooldown += #global_tick itemio.math
