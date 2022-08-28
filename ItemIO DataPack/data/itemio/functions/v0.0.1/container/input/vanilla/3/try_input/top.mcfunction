execute store success score #if_item itemio.math.input if data storage itemio:main.input Items[{Slot:0b}]
execute if score #if_item itemio.math.input matches 0 run function itemio:v0.0.1/container/input/vanilla/3/try_input/top/unless_item
execute if score #if_item itemio.math.input matches 1 run function itemio:v0.0.1/container/input/custom/try_input/0/if_item
execute if score #servos_transfer itemio.math matches 1 if score #full_input itemio.math.input matches 0 if score #if_item itemio.math.input matches 1 run function #itemio:calls/disable_servo

	