execute store success score #if_item itemio.math if data storage itemio:main Items[{Slot:15b}]
execute if score #if_item itemio.math matches 0 run function itemio:container/working/custom/try_input/15/unless_item
execute if score #if_item itemio.math matches 1 run function itemio:container/working/custom/try_input/15/if_item

	