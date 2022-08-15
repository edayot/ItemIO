
execute as @e[type=marker,tag=example.cable] at @s unless block ~ ~ ~ conduit run function example:destroy_cable
execute as @e[tag=example.summoned.input] at @s run function example:servo_place_input
execute as @e[tag=example.summoned.output] at @s run function example:servo_place_output

schedule function example:tick 1t replace