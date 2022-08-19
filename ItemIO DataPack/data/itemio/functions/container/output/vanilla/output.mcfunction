

#loading block data
data remove storage itemio:main.output input
data modify storage itemio:main.output input set from storage itemio:io input
data remove storage itemio:io output


scoreboard players set #if_item_input itemio.math.output 0
scoreboard players set #if_filter_define itemio.math.output 0
execute store result score #if_item_input itemio.math.output if data storage itemio:main.output input
execute store result score #if_filter_define itemio.math.output if data storage itemio:io filter 

execute if block ~ ~ ~ #itemio:container/normal run function itemio:container/output/vanilla/normal/repart
execute if block ~ ~ ~ #itemio:container/3 run function itemio:container/output/vanilla/3/repart


