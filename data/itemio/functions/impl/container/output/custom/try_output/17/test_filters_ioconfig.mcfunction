

data remove storage itemio:io item
data modify storage itemio:io item set from storage itemio:main.output Items[{Slot:17b}]

data modify storage itemio:io temp.filters set value []
data modify storage itemio:io temp.filters append from storage itemio:main.output ioconfig[0].filters

function #itemio:calls/filters_v2

execute if score #filters.valid_item itemio.io matches 1 run function itemio:impl/container/output/custom/try_output/17/output



