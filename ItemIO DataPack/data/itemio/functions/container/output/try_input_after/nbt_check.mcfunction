data remove storage itemio:main Item1
data remove storage itemio:main Item2

data modify storage itemio:main Item1 set from storage itemio:io output
data modify storage itemio:main Item2 set from entity @s data.itemio.ioconfig.item

data remove storage itemio:main Item1.Slot
data remove storage itemio:main Item2.Slot

data remove storage itemio:main Item1.Count
data remove storage itemio:main Item2.Count

scoreboard players set #valid_item itemio.math 0
execute store result score #!same_item itemio.math run data modify storage itemio:main Item1 set from storage itemio:main Item2
execute if score #!same_item itemio.math matches 0 run scoreboard players set #valid_item itemio.math 1
