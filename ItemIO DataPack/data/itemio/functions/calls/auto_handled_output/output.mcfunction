
scoreboard players set #success_output itemio.math.output 1

data modify storage itemio:io output set from storage itemio:io Item_auto_output

execute store result score #test_count_output itemio.math.output run data get storage itemio:io output.Count
execute if score #test_count_output itemio.math.output > #max_output_count itemio.math.output store result storage itemio:io output.Count int 1 run scoreboard players get #max_output_count itemio.math.output


execute store result score #remove_count itemio.math.output run data get storage itemio:io output.Count
execute if score #try_input_after itemio.math.output matches 1 run function #itemio:calls/try_input_after
execute if score #try_input_after itemio.math.output matches 1 if score #success_input itemio.math.input matches 0 run scoreboard players set #success_output itemio.math.output 0
