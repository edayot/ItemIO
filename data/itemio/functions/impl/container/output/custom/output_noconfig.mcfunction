



#loading block data
data remove storage itemio:main.output Items
data modify storage itemio:main.output Items set from block ~ ~ ~ Items
data remove storage itemio:main.output Items[{tag:{itemio:{gui:1b}}}]
data remove storage itemio:main.output Items[{tag:{simplenergy:{texture_item:1b}}}]

data remove storage itemio:main.output input
data modify storage itemio:main.output input set from storage itemio:io input
data remove storage itemio:io output

data remove storage itemio:main.output filters 
data modify storage itemio:main.output filters set from storage itemio:io filters

execute store result score #if_ioconfig itemio.math.output if data storage itemio:main.output ioconfig[0] 
execute store result score #if_filters_define itemio.math.output if data storage itemio:main.output filters[0]


