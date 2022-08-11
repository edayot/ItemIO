scoreboard players set #valid_item itemio.math 0

scoreboard players set #!same_id itemio.math 1
data modify storage itemio:main id1 set value ""
data modify storage itemio:main id2 set value ""
data modify storage itemio:main id1 set from storage itemio:io filter.id
data modify storage itemio:main id2 set from storage itemio:io item.id

execute store success score #!same_id itemio.math run data modify storage itemio:main id1 set from storage itemio:main id2

execute if score #!same_id itemio.math matches 0 run scoreboard players set #valid_item itemio.math 1
