



#loading block data
data remove storage itemio:main.output Items
data modify storage itemio:main.output Items set from block ~ ~ ~ Items
data remove storage itemio:main.output Items[{tag:{itemio:{gui:1b}}}]
data remove storage itemio:main.output Items[{tag:{simplenergy:{texture_item:1b}}}]

data remove storage itemio:main.output input
data modify storage itemio:main.output input set from storage itemio:io input
data remove storage itemio:io output

execute store result score #if_ioconfig itemio.math.output if data storage itemio:main.output ioconfig[0] 
execute store result score #if_filter_define itemio.math.output if data storage itemio:io filter 


execute if data storage itemio:io {output_side:"top"} if score #if_ioconfig itemio.math.output matches 1 run function itemio:v0.0.1/container/output/custom/repart_output/top
execute if data storage itemio:io {output_side:"bottom"} if score #if_ioconfig itemio.math.output matches 1 run function itemio:v0.0.1/container/output/custom/repart_output/bottom
execute if data storage itemio:io {output_side:"north"} if score #if_ioconfig itemio.math.output matches 1 run function itemio:v0.0.1/container/output/custom/repart_output/north
execute if data storage itemio:io {output_side:"south"} if score #if_ioconfig itemio.math.output matches 1 run function itemio:v0.0.1/container/output/custom/repart_output/south
execute if data storage itemio:io {output_side:"east"} if score #if_ioconfig itemio.math.output matches 1 run function itemio:v0.0.1/container/output/custom/repart_output/east
execute if data storage itemio:io {output_side:"west"} if score #if_ioconfig itemio.math.output matches 1 run function itemio:v0.0.1/container/output/custom/repart_output/west
execute if data storage itemio:io {output_side:"wireless"} if score #if_ioconfig itemio.math.output matches 1 run function itemio:v0.0.1/container/output/custom/repart_output

