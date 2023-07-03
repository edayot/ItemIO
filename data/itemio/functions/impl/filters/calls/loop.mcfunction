


scoreboard players set #if_filter_in_loop itemio.io 1

#tellraw @a {"nbt":"filter","storage":"itemio:io"}

data remove storage itemio:io filter
data modify storage itemio:io filter set from storage itemio:main temp.filters[0]
scoreboard players set #filter.valid_item itemio.io 1
#tellraw @a {"nbt":"filter","storage":"itemio:io"}
function #itemio:event/filter_v2

execute if score #filter.valid_item itemio.io matches 1 run scoreboard players set #filters.valid_item itemio.io 1
execute if score #filter.valid_item itemio.io matches 0 run data remove storage itemio:main temp.filters[0] 
execute if score #filter.valid_item itemio.io matches 0 if data storage itemio:main temp.filters[0] run function itemio:impl/filters/calls/loop


