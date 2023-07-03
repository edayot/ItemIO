data remove storage itemio:io item
data modify storage itemio:io item set from storage itemio:io Item_auto_output
function #itemio:call/filters_v2

execute if score #filters.valid_item itemio.math matches 1 run function itemio:impl/container/auto_handled_output/output



