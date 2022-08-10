
scoreboard players set #success_output itemio.math 1

data modify storage itemio:io output set from storage itemio:main Items[0]

#check maxcount
execute store result score #test_count_output itemio.math run data get storage itemio:io output.Count
execute if score #test_count_output itemio.math > #max_output_count itemio.math store result storage itemio:io output.Count int 1 run scoreboard players get #max_output_count itemio.math

execute store result score #slot_container itemio.math run data get storage itemio:main Items[0].Slot
execute if score #slot_container itemio.math matches 0 run item modify block ~ ~ ~ container.0 itemio:output/remove_count
execute if score #slot_container itemio.math matches 1 run item modify block ~ ~ ~ container.1 itemio:output/remove_count
execute if score #slot_container itemio.math matches 2 run item modify block ~ ~ ~ container.2 itemio:output/remove_count
execute if score #slot_container itemio.math matches 3 run item modify block ~ ~ ~ container.3 itemio:output/remove_count
execute if score #slot_container itemio.math matches 4 run item modify block ~ ~ ~ container.4 itemio:output/remove_count
execute if score #slot_container itemio.math matches 5 run item modify block ~ ~ ~ container.5 itemio:output/remove_count
execute if score #slot_container itemio.math matches 6 run item modify block ~ ~ ~ container.6 itemio:output/remove_count
execute if score #slot_container itemio.math matches 7 run item modify block ~ ~ ~ container.7 itemio:output/remove_count
execute if score #slot_container itemio.math matches 8 run item modify block ~ ~ ~ container.8 itemio:output/remove_count
execute if score #slot_container itemio.math matches 9 run item modify block ~ ~ ~ container.9 itemio:output/remove_count
execute if score #slot_container itemio.math matches 10 run item modify block ~ ~ ~ container.10 itemio:output/remove_count
execute if score #slot_container itemio.math matches 11 run item modify block ~ ~ ~ container.11 itemio:output/remove_count
execute if score #slot_container itemio.math matches 12 run item modify block ~ ~ ~ container.12 itemio:output/remove_count
execute if score #slot_container itemio.math matches 13 run item modify block ~ ~ ~ container.13 itemio:output/remove_count
execute if score #slot_container itemio.math matches 14 run item modify block ~ ~ ~ container.14 itemio:output/remove_count
execute if score #slot_container itemio.math matches 15 run item modify block ~ ~ ~ container.15 itemio:output/remove_count
execute if score #slot_container itemio.math matches 16 run item modify block ~ ~ ~ container.16 itemio:output/remove_count
execute if score #slot_container itemio.math matches 17 run item modify block ~ ~ ~ container.17 itemio:output/remove_count
execute if score #slot_container itemio.math matches 18 run item modify block ~ ~ ~ container.18 itemio:output/remove_count
execute if score #slot_container itemio.math matches 19 run item modify block ~ ~ ~ container.19 itemio:output/remove_count
execute if score #slot_container itemio.math matches 20 run item modify block ~ ~ ~ container.20 itemio:output/remove_count
execute if score #slot_container itemio.math matches 21 run item modify block ~ ~ ~ container.21 itemio:output/remove_count
execute if score #slot_container itemio.math matches 22 run item modify block ~ ~ ~ container.22 itemio:output/remove_count
execute if score #slot_container itemio.math matches 23 run item modify block ~ ~ ~ container.23 itemio:output/remove_count
execute if score #slot_container itemio.math matches 24 run item modify block ~ ~ ~ container.24 itemio:output/remove_count
execute if score #slot_container itemio.math matches 25 run item modify block ~ ~ ~ container.25 itemio:output/remove_count
execute if score #slot_container itemio.math matches 26 run item modify block ~ ~ ~ container.26 itemio:output/remove_count



