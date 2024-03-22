setblock -30000000 22 1610 yellow_shulker_box
setblock -30000000 23 1610 barrel
data modify block -30000000 22 1610 Items append from storage itemio:main.input inputs[]
data modify block -30000000 23 1610 Items set from storage itemio:main.input Items

raw loot insert -30000000 23 1610 mine -30000000 22 1610 command_block[minecraft:custom_data={drop_contents:1b}]
data modify storage itemio:main.input Items set from block -30000000 23 1610 Items