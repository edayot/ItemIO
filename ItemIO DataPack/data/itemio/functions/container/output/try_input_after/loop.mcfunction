function #itemio:calls/input

execute if score #success_input itemio.math.input matches 0 run tag @e[tag=itemio.transfer.destination,tag=!itemio.transfer.destination.already,limit=1,sort=nearest] add itemio.transfer.destination.already
execute if score #success_input itemio.math.input matches 0 at @e[tag=itemio.transfer.destination,tag=!itemio.transfer.destination.already,limit=1,sort=nearest] run function #itemio:calls/try_input_after/loop