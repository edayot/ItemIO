execute store success score #if_item itemio.math.input if data storage itemio:main.input Items[{Slot:7b}]
execute if score #if_item itemio.math.input matches 0 run function itemio:container/input/custom/try_input/7/unless_item
execute if score #if_item itemio.math.input matches 1 run function itemio:container/input/custom/try_input/7/if_item

	