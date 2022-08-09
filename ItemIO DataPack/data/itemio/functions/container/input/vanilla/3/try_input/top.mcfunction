execute store success score #if_item itemio.math if data storage itemio:main Items[{Slot:0b}]
execute if score #if_item itemio.math matches 0 run function itemio:container/input/vanilla/3/try_input/top/unless_item
execute if score #if_item itemio.math matches 1 run function itemio:container/input/custom/try_input/0/if_item

	