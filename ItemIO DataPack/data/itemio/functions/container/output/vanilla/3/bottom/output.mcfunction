
scoreboard players set #success_output itemio.math.output 1

data modify storage itemio:io output set from storage itemio:main.output Items[{Slot:2b}]

#check maxcount
execute store result score #test_count_output itemio.math.output run data get storage itemio:io output.Count
execute if score #test_count_output itemio.math.output > #max_output_count itemio.math.output store result storage itemio:io output.Count int 1 run scoreboard players get #max_output_count itemio.math.output



execute unless score #try_input_after itemio.math.output matches 1 run item modify block ~ ~ ~ container.2 itemio:output/remove_count
execute if score #try_input_after itemio.math.output matches 1 run function itemio:container/output/vanilla/3/bottom/try_input_after