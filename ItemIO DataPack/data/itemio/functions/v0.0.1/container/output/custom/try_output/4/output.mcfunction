

scoreboard players set #success_output itemio.math.output 1

data modify storage itemio:io output set from storage itemio:main.output Items[{Slot:4b}]

#check maxcount
execute store result score #test_count_output itemio.math.output run data get storage itemio:io output.Count
execute if score #test_count_output itemio.math.output > #max_output_count itemio.math.output store result storage itemio:io output.Count int 1 run scoreboard players get #max_output_count itemio.math.output

scoreboard players operation #remove_count itemio.math.output = #max_output_count itemio.math.output

execute if score #try_input_after itemio.math.output matches 1 run function #itemio:calls/try_input_after
execute if score #remove_count itemio.math.output matches 1.. run item modify block ~ ~ ~ container.4 itemio:output/remove_count
