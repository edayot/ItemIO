
scoreboard players set #success_output itemio.math 0


#loading block data
data remove storage itemio:main Items
data modify storage itemio:main Items set from block ~ ~ ~ Items
data remove storage itemio:main input
data modify storage itemio:main input set from storage itemio:io input
data remove storage itemio:io output

execute store result score #if_ioconfig itemio.math if data storage itemio:main ioconfig[0] 

execute if data storage itemio:io {output_side:"top"} if score #if_ioconfig itemio.math matches 1 run function itemio:container/output/custom/repart_output/top
execute if data storage itemio:io {output_side:"bottom"} if score #if_ioconfig itemio.math matches 1 run function itemio:container/output/custom/repart_output/bottom
execute if data storage itemio:io {output_side:"north"} if score #if_ioconfig itemio.math matches 1 run function itemio:container/output/custom/repart_output/north
execute if data storage itemio:io {output_side:"south"} if score #if_ioconfig itemio.math matches 1 run function itemio:container/output/custom/repart_output/south
execute if data storage itemio:io {output_side:"east"} if score #if_ioconfig itemio.math matches 1 run function itemio:container/output/custom/repart_output/east
execute if data storage itemio:io {output_side:"west"} if score #if_ioconfig itemio.math matches 1 run function itemio:container/output/custom/repart_output/west
execute if data storage itemio:io {output_side:"wireless"} if score #if_ioconfig itemio.math matches 1 run function itemio:container/output/custom/repart_output

