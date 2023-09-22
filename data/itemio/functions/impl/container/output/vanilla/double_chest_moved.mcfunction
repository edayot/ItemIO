data remove storage itemio:main.output Items
data modify storage itemio:main.output Items set from block ~ ~ ~ Items
data remove storage itemio:main.output Items[{tag:{itemio:{gui:1b}}}]



execute if data storage itemio:main.output Items[0] run function itemio:impl/container/output/vanilla/output/loop_item


