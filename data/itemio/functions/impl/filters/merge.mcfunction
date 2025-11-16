
# Merge filter
#say MERGE

scoreboard players set #filter.valid_item itemio.io 0


data remove entity @s container.0
data modify entity @s container.0 set from storage itemio:io item

data modify entity @s container.0 merge from storage itemio:io filter.merge

scoreboard players set #!same_id itemio.math 1
execute store success score #!same_id itemio.math run data modify entity @s container.0 set from storage itemio:io item

execute if score #!same_id itemio.math matches 0 run scoreboard players set #filter.valid_item itemio.io 1

