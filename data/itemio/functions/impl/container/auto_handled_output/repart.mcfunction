# @public
#A item arrive from : storage itemio:io Item_auto_output


execute if score #if_filter_define itemio.math.output matches 1 run function itemio:impl/container/auto_handled_output/test_filter

execute if score #if_filter_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 1 run function itemio:impl/container/auto_handled_output/test_nbt
execute if score #if_filter_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 0 run function itemio:impl/container/auto_handled_output/output
