execute store success score #if_item itemio.math if data storage itemio:main Items[{Slot:13b}]
execute if score #if_item itemio.math matches 0 run function itemio:container/working/custom/try_input/13/unless_item
execute if score #if_item itemio.math matches 1 run function itemio:container/working/custom/try_input/13/if_item

	