execute store success score #if_item itemio.math if data storage itemio:main Items[{Slot:23b}]
execute if score #if_item itemio.math matches 0 run function itemio:working/custom/try_input/23/unless_item
execute if score #if_item itemio.math matches 1 run function itemio:working/custom/try_input/23/if_item

	