execute store success score #if_item itemio.math if data storage itemio:main.input Items[{Slot:8b}]
execute if score #if_item itemio.math matches 0 run function itemio:container/input/custom/try_input/8/unless_item
execute if score #if_item itemio.math matches 1 run function itemio:container/input/custom/try_input/8/if_item

	