data modify storage itemio:io input.Slot set value 0
data modify block ~ ~ ~ Items append from storage itemio:io input

scoreboard players set #success_input itemio.math 1
scoreboard players set #full_input itemio.math 1
