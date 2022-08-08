execute store success score #if_item itemio.math if data storage itemio:main Items[{Slot:11b}]
execute if score #if_item itemio.math matches 0 run function itemio:working/custom/try_input/11/unless_item
execute if score #if_item itemio.math matches 1 run function itemio:working/custom/try_input/11/if_item

	