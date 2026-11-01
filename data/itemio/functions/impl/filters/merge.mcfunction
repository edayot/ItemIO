
# Merge filter
# The filter is merged on a copy of the item, if the item doesn't change, the filter is valid

scoreboard players set #filter.valid_item itemio.io 0

data remove storage itemio:main temp.merge
data modify storage itemio:main temp.merge set from storage itemio:io item
data modify storage itemio:main temp.merge merge from storage itemio:io filter.merge

scoreboard players set #!same_id itemio.math 1
execute store success score #!same_id itemio.math run data modify storage itemio:main temp.merge set from storage itemio:io item

execute if score #!same_id itemio.math matches 0 run scoreboard players set #filter.valid_item itemio.io 1
