data remove storage itemio:main.input temp.item_crafter.Slot
data remove storage itemio:main.input temp.item_crafter.count



data modify storage itemio:main.input temp.item_input set from storage itemio:main.input input
data remove storage itemio:main.input temp.item_input.Slot
data remove storage itemio:main.input temp.item_input.count



execute store success score #modified_item itemio.math.input run data modify storage itemio:main.input temp.item_input set from storage itemio:main.input temp.item_crafter


$execute if score #modified_item itemio.math.input matches 0 run data modify storage itemio:main.input Items_clean append from storage itemio:main.input Items[{Slot:$(slot_clean)b}]

