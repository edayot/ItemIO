execute store success score #if_item itemio.math.input if data storage itemio:main.input Items[{Slot:20b}]
execute if score #if_item itemio.math.input matches 0 run function itemio:v0.0.1/container/input/custom/try_input/20/unless_item
execute if score #if_item itemio.math.input matches 1 run function itemio:v0.0.1/container/input/custom/try_input/20/if_item

	