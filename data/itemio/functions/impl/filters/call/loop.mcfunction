




data remove storage itemio:io filter
data modify storage itemio:io filter set from storage itemio:main temp.filters[0]

function #itemio:event/filter_v2

execute if score #valid_item itemio.math matches 1 run scoreboard players set #filters.valid_item itemio.math 1
execute if score #valid_item itemio.math matches 0 run data remove storage itemio:main temp.filters[0] 
execute if score #valid_item itemio.math matches 0 if data storage itemio:main temp.filters[0] run function itemio:impl/filters/call/loop


