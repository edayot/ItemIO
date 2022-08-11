execute store success score #if_item itemio.math if data storage itemio:main.input Items[{Slot:17b}]
execute if score #if_item itemio.math matches 0 run function itemio:container/input/custom/try_input/17/unless_item
execute if score #if_item itemio.math matches 1 run function itemio:container/input/custom/try_input/17/if_item

	