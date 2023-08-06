scoreboard players set #valid_item itemio.math 1
execute if data storage itemio:main servo_items2[0] run function itemio:impl/container/output/try_input_after/nbt_check


scoreboard players set #success_input itemio.io 0
execute if score #valid_item itemio.math matches 1 run function itemio:impl/container/output/try_input_after/input


