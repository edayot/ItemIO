#init
data remove storage itemio:main input
data modify storage itemio:main input set from storage itemio:io input


scoreboard players set #success_output itemio.math 0


#loading block data
data remove storage itemio:main Items
data modify storage itemio:main Items set from block ~ ~ ~ Items
data remove storage itemio:main input
data modify storage itemio:main input set from storage itemio:io input
data remove storage itemio:io output



execute store result score #if_item_input itemio.math if data storage itemio:main input
execute store result score #if_filter_define itemio.math if data storage itemio:io filter 

execute if block ~ ~ ~ #itemio:container/normal run function itemio:container/output/vanilla/normal/repart

