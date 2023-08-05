

scoreboard players add #max_output_count itemio.io 0

scoreboard players set #try_input_after itemio.math.output 1
execute if entity @e[tag=itemio.transfer.destination] run function #itemio:calls/output
scoreboard players set #try_input_after itemio.math.output 0