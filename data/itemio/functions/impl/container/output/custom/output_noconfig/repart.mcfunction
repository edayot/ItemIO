
data remove storage itemio:main.input temp.args_check_filters
data modify storage itemio:main.input temp.args_check_filters.Slot set from storage itemio:main.input ioconfig[0].Slot
execute store result storage itemio:main.input temp.args_check_filters.Slot int 1 run data get storage itemio:main.input temp.args_check_filters.Slot


execute if score #if_filters_define itemio.math.output matches 1 run function itemio:impl/container/output/custom/output_no_config/check_input_filters with storage itemio:main.output temp.args_check_filters
execute if score #if_filters_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 1 run function itemio:impl/container/output/custom/output_no_config/check_item_input with storage itemio:main.output temp.args_check_filters
execute if score #if_filters_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 0 run function itemio:impl/container/output/custom/output_no_config/check_filters with storage itemio:main.output temp.args_check_filters



