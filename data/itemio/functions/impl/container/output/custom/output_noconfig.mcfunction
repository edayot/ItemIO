



#loading block data
data remove storage itemio:main.output Items
data modify storage itemio:main.output Items set from block ~ ~ ~ Items
data remove storage itemio:main.output Items[{tag:{itemio:{gui:1b}}}]

data remove storage itemio:main.output input
data modify storage itemio:main.output input set from storage itemio:io input
data remove storage itemio:io output

data modify storage itemio:main.output filters set value []
data modify storage itemio:main.output filters set from storage itemio:io filters

scoreboard players set #if_item_input itemio.math.output 0
scoreboard players set #if_filters_define itemio.math.output 0
execute store result score #if_filters_define itemio.math.output if data storage itemio:main.output filters[0]
execute store result score #if_item_input itemio.math.output if data storage itemio:main.output input


data remove storage itemio:main.output temp.args_loop_ioconfig
data modify storage itemio:main.output temp.args_loop_ioconfig.output_side set from storage itemio:io output_side
execute if data storage itemio:main.output ioconfig[0] run function itemio:impl/container/output/custom/output_no_config/loop_ioconfig with storage itemio:main.output temp.args_loop_ioconfig
