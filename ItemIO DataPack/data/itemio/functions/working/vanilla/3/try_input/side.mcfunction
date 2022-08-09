execute store success score #if_item itemio.math if data storage itemio:main Items[{Slot:1b}]
execute if score #if_item itemio.math matches 0 run function itemio:working/vanilla/3/try_input/side/unless_item
execute if score #if_item itemio.math matches 1 run function itemio:working/custom/try_input/1/if_item

	