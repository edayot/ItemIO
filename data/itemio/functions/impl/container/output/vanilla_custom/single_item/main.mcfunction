

execute unless data storage itemio:main.output ItemUnique run return fail


data remove storage itemio:main.output input
data modify storage itemio:main.output input set from storage itemio:io input
data remove storage itemio:io output

scoreboard players set #if_item_input itemio.math.output 0
scoreboard players set #if_filters_define itemio.math.output 0
execute store result score #if_item_input itemio.math.output if data storage itemio:main.output input
execute store result score #if_filters_define itemio.math.output if data storage itemio:io filters[0]


data modify storage itemio:main.output filters set from storage itemio:io filters

execute 
    if score #if_filters_define itemio.math.output matches 1 
    run function ~/check_filters:
        data remove storage itemio:io filters
        data modify storage itemio:io filters set from storage itemio:main.output filters
        data modify storage itemio:io item set from storage itemio:main.output ItemUnique

        function #itemio:calls/filters_v2

        execute if score #filters.valid_item itemio.io matches 1 run function ~/../output

execute 
    if score #if_filters_define itemio.math.output matches 0 
    if score #if_item_input itemio.math.output matches 1 
    run function ~/check_item_input:
        data remove storage itemio:main.output Item1
        data remove storage itemio:main.output Item2


        data modify storage itemio:main.output Item1 set from storage itemio:main.output input
        data modify storage itemio:main.output Item2 set from storage itemio:main.output ItemUnique
        data remove storage itemio:main.output Item1.count
        data remove storage itemio:main.output Item1.Slot
        data remove storage itemio:main.output Item2.count
        data remove storage itemio:main.output Item2.Slot

        execute store result score #!same_item itemio.math.output run data modify storage itemio:main.output Item1 set from storage itemio:main.output Item2
        execute if score #!same_item itemio.math.output matches 0 run function ~/../output


execute 
    if score #if_filters_define itemio.math.output matches 0 
    if score #if_item_input itemio.math.output matches 0 
    run function ~/output:
        
        scoreboard players set #success_output itemio.io 1

        data modify storage itemio:io output set from storage itemio:main.output ItemUnique

        #check maxcount
        execute store result score #test_count_output itemio.math.output run data get storage itemio:io output.count
        execute if score #test_count_output itemio.math.output > #max_output_count itemio.io store result storage itemio:io output.count int 1 run scoreboard players get #max_output_count itemio.io

        scoreboard players operation #remove_count itemio.math.output = #max_output_count itemio.io

        execute if score #try_input_after itemio.math.output matches 1 run function #itemio:calls/try_input_after
        execute if score #remove_count itemio.math.output matches 1.. run item modify block ~ ~ ~ contents itemio:impl/internal/output/remove_count


        execute if score #remove_count itemio.math.output matches 0 run scoreboard players set #success_output itemio.io 0






