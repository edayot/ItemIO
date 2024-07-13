function itemio:impl/servo/make_transfer_normal


scoreboard players remove #nb_retry itemio.math 1
execute if score #nb_retry itemio.math matches 1.. run function itemio:impl/servo/make_transfer_loop
