
# An empty slot has nothing to output
$execute unless data storage itemio:main.output Items[{Slot:$(Slot)b}] run return 0
$data modify storage itemio:main.output item set from storage itemio:main.output Items[{Slot:$(Slot)b}]

# tellraw @a ["#if_filters_define itemio.math.output ",{score:{objective:"itemio.math.output",name:"#if_filters_define"}}]
# tellraw @a ["#if_item_input itemio.math.output ",{score:{objective:"itemio.math.output",name:"#if_item_input"}}]

execute if score #if_filters_define itemio.math.output matches 1 run return run function itemio:impl/container/output/custom/output_noconfig/check_input_filters
execute if score #if_item_input itemio.math.output matches 1 run return run function itemio:impl/container/output/custom/output_noconfig/check_item_input
function itemio:impl/container/output/custom/output_noconfig/check_filters
