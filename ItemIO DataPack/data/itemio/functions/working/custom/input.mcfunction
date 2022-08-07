
#loading ioconfig
data remove storage itemio:io ioconfig 
data modify storage itemio:io ioconfig set from entity @s data.itemio.ioconfig
data remove storage itemio:io ioconfig[{mode:"output"}]

scoreboard players set #success_input itemio.math 0
scoreboard players set #full_input itemio.math 0


#loading block data
data remove storage itemio:main Items
data modify storage itemio:main Items set from block ~ ~ ~ Items
data modify storage itemio:main input set from storage itemio:io input

execute if data storage itemio:io ioconfig[0] run function itemio:working/custom/try_input


