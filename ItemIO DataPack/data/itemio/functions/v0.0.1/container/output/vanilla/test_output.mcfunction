
data remove storage itemio:main.output Items
data modify storage itemio:main.output Items set from block ~ ~ ~ Items
data remove storage itemio:main.output Items[{tag:{itemio:{gui:1b}}}]
data remove storage itemio:main.output Items[{tag:{simplenergy:{texture_item:1b}}}]


execute if data storage itemio:main.output Items[0] run function itemio:v0.0.1/container/output/vanilla/output