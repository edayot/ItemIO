execute store result score #count_container itemio.math run data get storage itemio:main Items[{Slot:0b}].Count
execute store result score #count_input itemio.math run data get storage itemio:io input.Count


scoreboard players set #full_stack itemio.math 64
execute as 0015d1f0-0000-008f-0000-000000000000 if predicate itemio:stack16 run scoreboard players set #full_stack itemio.math 16
execute as 0015d1f0-0000-008f-0000-000000000000 if predicate itemio:stack1 run scoreboard players set #full_stack itemio.math 1

