data remove storage itemio:main.output Item1
data remove storage itemio:main.output Item2


data modify storage itemio:main.output Item1 set from storage itemio:main.output input
data modify storage itemio:main.output Item2 set from storage itemio:main.output Items[{Slot:24b}]
data remove storage itemio:main.output Item1.Count
data remove storage itemio:main.output Item1.Slot
data remove storage itemio:main.output Item2.Count
data remove storage itemio:main.output Item2.Slot

execute store result score #!same_item itemio.math.output run data modify storage itemio:main.output Item1 set from storage itemio:main.output Item2
execute if score #!same_item itemio.math.output matches 0 run function itemio:v0.0.1/container/output/custom/try_output/24/output
