data modify storage itemio:main.input temp.Item1 set from storage itemio:main.input input
$data modify storage itemio:main.input temp.Item2 set from storage itemio:main.input Items[{Slot:$(Slot)b}]

data remove storage itemio:main.input temp.Item1.Slot
data remove storage itemio:main.input temp.Item1.count
data remove storage itemio:main.input temp.Item2.Slot
data remove storage itemio:main.input temp.Item2.count

execute store success score #!same_item itemio.math.input run data modify storage itemio:main.input temp.Item1 set from storage itemio:main.input temp.Item2
execute if score #!same_item itemio.math.input matches 0 run function itemio:impl/container/input/custom/input_no_config/process_input/if_item/sup/fill with storage itemio:main.input temp.args