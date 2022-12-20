setblock -30000000 22 1610 yellow_shulker_box
setblock -30000000 23 1610 dropper
data modify block -30000000 22 1610 Items append from storage itemio:main.input input
data modify block -30000000 23 1610 Items set from storage itemio:main.input Items

loot insert -30000000 23 1610 mine -30000000 22 1610 air{drop_contents:1b}
data modify storage itemio:main.input Items set from block -30000000 23 1610 Items