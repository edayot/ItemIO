

scoreboard players set #!same_id itemio.math 1
data modify storage itemio:main temp.id1 set value ""
data modify storage itemio:main temp.id2 set value ""
data modify storage itemio:main temp.id1 set from storage itemio:main temp.id[0]
data modify storage itemio:main temp.id2 set from storage itemio:io item.tag.smithed.id

execute store success score #!same_id itemio.math run data modify storage itemio:main temp.id1 set from storage itemio:main temp.id2



execute if score #!same_id itemio.math matches 0 run scoreboard players set #filter.valid_item itemio.io 1
execute if score #!same_id itemio.math matches 1 run data remove storage itemio:main temp.id[0]
execute if score #!same_id itemio.math matches 1 if data storage itemio:main temp.id[0] run function itemio:impl/filters/smithed_id/loop

