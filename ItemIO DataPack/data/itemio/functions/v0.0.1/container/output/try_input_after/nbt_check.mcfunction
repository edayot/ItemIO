data remove storage itemio:main Item1
data remove storage itemio:main Item2

data modify storage itemio:main Item1 set from storage itemio:io output
data modify storage itemio:main Item2 set from storage itemio:main servo_items[0]

data remove storage itemio:main Item1.Slot
data remove storage itemio:main Item2.Slot

data remove storage itemio:main Item1.Count
data remove storage itemio:main Item2.Count

scoreboard players set #valid_item itemio.math 0
execute store result score #!same_item itemio.math run data modify storage itemio:main Item1 set from storage itemio:main Item2
execute if score #!same_item itemio.math matches 0 run scoreboard players set #valid_item itemio.math 1
execute if score #valid_item itemio.math matches 0 run data remove storage itemio:main servo_items[0]
execute if score #valid_item itemio.math matches 0 if data storage itemio:main servo_items[0] run function itemio:v0.0.1/container/output/try_input_after/nbt_check
