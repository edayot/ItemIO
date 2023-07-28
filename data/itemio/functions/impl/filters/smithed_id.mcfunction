scoreboard players set #filter.valid_item itemio.io 0

data remove storage itemio:main temp.id
data modify storage itemio:main temp.id set from storage itemio:io filter.smithed.id

execute if score #filter.valid_item itemio.io matches 0 if data storage itemio:main temp.id[0] run function itemio:impl/filters/smithed_id/loop


