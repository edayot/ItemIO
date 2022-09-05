scoreboard players set #valid_item itemio.math 1
execute if data storage itemio:main servo_items2[0] run function itemio:v0.0.1/container/output/try_input_after/nbt_check


scoreboard players set #success_input itemio.math.input 0
execute if score #valid_item itemio.math matches 1 run function itemio:v0.0.1/container/output/try_input_after/input


execute if score #success_input itemio.math.input matches 0 run tag @s add itemio.transfer.destination.already
execute if score #success_input itemio.math.input matches 0 as @e[tag=itemio.transfer.destination,tag=!itemio.transfer.destination.already,limit=1,sort=nearest] unless entity @s[distance=..0.5001] at @s run function itemio:v0.0.1/container/output/try_input_after/loop_items
