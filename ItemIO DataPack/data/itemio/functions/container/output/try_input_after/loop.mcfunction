

scoreboard players set #valid_item itemio.math 1
execute if data entity @s data.itemio.ioconfig.filter run function itemio:container/output/try_input_after/filter

execute if data entity @s data.itemio.ioconfig.item run function itemio:container/output/try_input_after/nbt_check


scoreboard players set #success_input itemio.math.input 0
execute if score #valid_item itemio.math matches 1 run function itemio:container/output/try_input_after/input


execute if score #success_input itemio.math.input matches 0 run tag @s add itemio.transfer.destination.already
execute if score #success_input itemio.math.input matches 0 as @e[tag=itemio.transfer.destination,tag=!itemio.transfer.destination.already,limit=1,sort=nearest] at @s run function itemio:container/output/try_input_after/loop
