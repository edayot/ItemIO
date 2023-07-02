scoreboard players set #success_input itemio.io 0
function itemio:impl/container/output/try_input_after/input


execute if score #success_input itemio.io matches 0 run tag @s add itemio.transfer.destination.already
execute if score #success_input itemio.io matches 0 as @e[tag=itemio.transfer.destination,tag=!itemio.transfer.destination.already,limit=1,sort=nearest] unless entity @s[distance=..0.5001] at @s run function itemio:impl/container/output/try_input_after/loop_normal
