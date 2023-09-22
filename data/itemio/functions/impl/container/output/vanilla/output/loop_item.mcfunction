
data remove storage itemio:main.output temp.args_loop_item
data modify storage itemio:main.output temp.args_loop_item.Slot set from storage itemio:main.output Items[0].Slot
execute store result storage itemio:main.output temp.args_loop_item.Slot int 1 run data get storage itemio:main.output temp.args_loop_item.Slot




execute if score #if_filters_define itemio.math.output matches 1 run function itemio:impl/container/output/vanilla/output/check_filters


execute if score #if_filters_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 1 run function itemio:impl/container/output/vanilla/output/check_item

execute if score #if_filters_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 0 run function itemio:impl/container/output/vanilla/output/process with storage itemio:main.output temp.args_loop_item



data remove storage itemio:main.output Items[0]
execute if data storage itemio:main.output Items[0] unless score #success_output itemio.io matches 1 run function itemio:impl/container/output/vanilla/output/loop_item




