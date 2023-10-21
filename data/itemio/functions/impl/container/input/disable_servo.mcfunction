# @public

execute as @e[tag=itemio.servo,distance=..1] store result score @s itemio.servo.cooldown run random value 75..100

kill @e[tag=itemio.transfer.destination.temp,distance=..0.5001]