



data modify storage itemio:io filters set value []
data modify storage itemio:io filters set from storage itemio:main.output ioconfig[0].filters
$data modify storage itemio:io item set from storage itemio:main.output Items[{Slot:$(Slot)b}]

function #itemio:calls/filters_v2


execute if score #filters.valid_item itemio.io matches 1 run function itemio:impl/container/output/custom/output_noconfig/process_output with storage itemio:main.output temp.args_check_filters


