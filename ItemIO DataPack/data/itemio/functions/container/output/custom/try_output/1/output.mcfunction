
scoreboard players set #success_output itemio.math 1

data modify storage itemio:io output set from storage itemio:main.output Items[{Slot:1b}]

#check maxcount
execute store result score #test_count_output itemio.math run data get storage itemio:io output.Count
execute if score #test_count_output itemio.math > #max_output_count itemio.math store result storage itemio:io output.Count int 1 run scoreboard players get #max_output_count itemio.math

item modify block ~ ~ ~ container.1 itemio:output/remove_count

