# @public

execute as @e[tag=itemio.servo.initialised,distance=..1.5] run function ~/random_cooldown:
    execute store result score @s itemio.servo.cooldown run random value 75..200
    scoreboard players operation @s itemio.servo.cooldown += #global_tick itemio.math

kill @e[tag=itemio.transfer.destination.temp,distance=..0.5001]