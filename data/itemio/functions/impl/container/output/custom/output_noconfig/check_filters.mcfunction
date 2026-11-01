
# The filters of the slot

execute unless data storage itemio:main.output slot.filters[0] run return run function itemio:impl/container/output/custom/output_noconfig/process_output with storage itemio:main.output temp.args_check_filters

data modify storage itemio:io filters set from storage itemio:main.output slot.filters
data modify storage itemio:io item set from storage itemio:main.output item

function itemio:impl/filters/calls/main
# tellraw @a ["#filters.valid_item itemio.io ",{score:{objective:"itemio.io",name:"#filters.valid_item"}}]

execute if score #filters.valid_item itemio.io matches 1 run function itemio:impl/container/output/custom/output_noconfig/process_output with storage itemio:main.output temp.args_check_filters
