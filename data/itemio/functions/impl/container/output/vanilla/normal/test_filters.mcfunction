data modify storage itemio:io item set from storage itemio:main.output Items[0]
function #itemio:calls/filters_v2


execute if score #filters.valid_item itemio.io matches 0 run data remove storage itemio:main.output Items[0]
execute if score #filters.valid_item itemio.io matches 0 if data storage itemio:main.output Items[0] run function itemio:impl/container/output/vanilla/normal/test_filter
execute if score #filters.valid_item itemio.io matches 1 if score #success_output itemio.io matches 0 run function itemio:impl/container/output/vanilla/normal/output



