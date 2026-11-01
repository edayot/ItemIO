data modify storage itemio:main servo_items_loop set from storage itemio:main servo_items

execute if score #if_items_defined itemio.math matches 1 run function itemio:impl/servo/make_transfer_items
execute if score #if_items_defined itemio.math matches 0 run function itemio:impl/servo/make_transfer_normal


# A failed transfer changed nothing, retrying it would fail again
scoreboard players remove #nb_retry itemio.math 1
execute if score #success_transfer itemio.io matches 1 if score #nb_retry itemio.math matches 1.. run function itemio:impl/servo/make_transfer_loop
