
data remove storage itemio:main.output Items
data modify storage itemio:main.output Items set from block ~ ~ ~ Items

execute if data storage itemio:main.output Items[0] run function itemio:container/output/vanilla/output