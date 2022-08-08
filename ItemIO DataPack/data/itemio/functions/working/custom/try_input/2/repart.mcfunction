execute store success score #if_item itemio.math if data storage itemio:main Items[{Slot:2b}]
execute if score #if_item itemio.math matches 0 run function itemio:working/custom/try_input/2/unless_item
execute if score #if_item itemio.math matches 1 run function itemio:working/custom/try_input/2/if_item

	