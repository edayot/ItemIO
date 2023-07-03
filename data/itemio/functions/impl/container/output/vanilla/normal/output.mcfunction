#say OUTPUT test
scoreboard players set #success_output itemio.io 1

data modify storage itemio:io output set from storage itemio:main.output Items[0]

#check maxcount
execute store result score #test_count_output itemio.math.output run data get storage itemio:io output.Count
execute if score #test_count_output itemio.math.output > #max_output_count itemio.io store result storage itemio:io output.Count int 1 run scoreboard players get #max_output_count itemio.io

scoreboard players set #remove_count itemio.math.output 0
scoreboard players operation #remove_count itemio.math.output = #max_output_count itemio.io

execute if score #try_input_after itemio.math.output matches 1 run function #itemio:calls/try_input_after
execute if score #remove_count itemio.math.output matches 1.. run function itemio:impl/container/output/vanilla/normal/output_slot

#Retry in not success input
execute if score #try_input_after itemio.math.output matches 1 if score #success_input itemio.io matches 0 run scoreboard players set #success_output itemio.io 0
execute if score #try_input_after itemio.math.output matches 1 if score #success_input itemio.io matches 0 run data remove storage itemio:main.output Items[0]
 
execute if score #try_input_after itemio.math.output matches 1 if score #success_input itemio.io matches 0 if data storage itemio:main.output Items[0] run function itemio:impl/container/output/vanilla/normal/repart

