data modify storage itemio:main temp.Item1 set from storage itemio:main input
data modify storage itemio:main temp.Item2 set from storage itemio:main Items[{Slot:2b}]

data remove storage itemio:main temp.Item1.Slot
data remove storage itemio:main temp.Item1.Count
data remove storage itemio:main temp.Item2.Slot
data remove storage itemio:main temp.Item2.Count

execute store success score #!same_item itemio.math run data modify storage itemio:main temp.Item1 set from storage itemio:main temp.Item2
execute if score #!same_item itemio.math matches 0 run function itemio:working/custom/try_input/2/if_item/inf/fill
