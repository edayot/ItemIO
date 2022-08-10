data remove storage itemio:main Item1
data remove storage itemio:main Item2


data modify storage itemio:main Item1 set from storage itemio:main input
data modify storage itemio:main Item2 set from storage itemio:main Items[{Slot:17b}]

execute store result score #!same_item itemio.math run data modify storage itemio:main Item1 set from storage itemio:main Item2
execute if score #!same_item itemio.math matches 0 run function itemio:container/output/custom/try_output/17/output
