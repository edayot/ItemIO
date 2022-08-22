execute if score #if_filter_define itemio.math.output matches 1 run function itemio:v0.0.1/container/output/custom/try_output_filter/bottom

execute if score #if_filter_define itemio.math.output matches 0 store result score #if_item_input itemio.math.output if data storage itemio:main.output input
execute if score #if_filter_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 1 run function itemio:v0.0.1/container/output/custom/try_output/bottom
execute if score #if_filter_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 0 run function itemio:v0.0.1/container/output/custom/try_output_nocheck/bottom

