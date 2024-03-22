#$say $(item)

$item replace block -30000000 23 1610 container.0 with $(item)
item modify block -30000000 23 1610 container.0 itemio:impl/internal/input/add_count

execute store result score #temp itemio.math run data get block -30000000 23 1610 Items[0].count 

$execute if score #temp itemio.math matches 1 run data modify storage itemio:main temp.result1 set value '$(result1)"$(item)",'
$execute if score #temp itemio.math matches 16 run data modify storage itemio:main temp.result16 set value '$(result16)"$(item)",'



$item replace block -30000000 22 1610 container.0 with $(item)
$item replace block -30000000 22 1610 container.1 with $(item)
item modify block -30000000 22 1610 container.0 itemio:impl/internal/input/add_count
item modify block -30000000 22 1610 container.1 itemio:impl/internal/input/add_count


setblock -30000000 24 1610 furnace
setblock -30000000 25 1610 blast_furnace
setblock -30000000 26 1610 smoker

raw loot insert -30000000 24 1610 mine -30000000 22 1610 command_block[minecraft:custom_data={drop_contents:1b}]
raw loot insert -30000000 25 1610 mine -30000000 22 1610 command_block[minecraft:custom_data={drop_contents:1b}]
raw loot insert -30000000 26 1610 mine -30000000 22 1610 command_block[minecraft:custom_data={drop_contents:1b}]

$execute if data block -30000000 24 1610 Items[{Slot:1b}] run data modify storage itemio:main temp.result_furnace set value '$(result_furnace)"$(item)",'
$execute if data block -30000000 25 1610 Items[{Slot:1b}] run data modify storage itemio:main temp.result_blast_furnace set value '$(result_blast_furnace)"$(item)",'
$execute if data block -30000000 26 1610 Items[{Slot:1b}] run data modify storage itemio:main temp.result_smoker set value '$(result_smoker)"$(item)",'
