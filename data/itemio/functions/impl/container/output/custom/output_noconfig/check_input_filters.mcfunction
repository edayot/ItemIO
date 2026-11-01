
# The filters of the output call

data remove storage itemio:io filters
data modify storage itemio:io filters set from storage itemio:main.output filters
data modify storage itemio:io item set from storage itemio:main.output item

function itemio:impl/filters/calls/main

execute if score #filters.valid_item itemio.io matches 1 run function itemio:impl/container/output/custom/output_noconfig/check_filters
