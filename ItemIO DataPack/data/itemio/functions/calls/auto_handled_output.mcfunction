
#A item arrive from : storage itemio:io Item_auto_output


data remove storage itemio:main.output input
data modify storage itemio:main.output input set from storage itemio:io input
data remove storage itemio:io output


scoreboard players set #if_item_input itemio.math.output 0
scoreboard players set #if_filter_define itemio.math.output 0
execute store result score #if_item_input itemio.math.output if data storage itemio:main.output input
execute store result score #if_filter_define itemio.math.output if data storage itemio:io filter 

execute if score #if_filter_define itemio.math.output matches 1 run function itemio:calls/auto_handled_output/test_filter

execute if score #if_filter_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 1 run function itemio:calls/auto_handled_output/test_nbt
execute if score #if_filter_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 0 run function itemio:calls/auto_handled_output/output
