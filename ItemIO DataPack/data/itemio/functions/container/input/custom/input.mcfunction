
#loading ioconfig
data remove storage itemio:main.input ioconfig 
execute if entity @s[type=marker] run data modify storage itemio:main.input ioconfig set from entity @s data.itemio.ioconfig
execute if entity @s[type=#itemio:item_frames] run data modify storage itemio:main.input ioconfig set from entity @s Item.tag.itemio.ioconfig
data remove storage itemio:main.input ioconfig[{mode:"output"}]

execute if data storage itemio:main.input ioconfig run function itemio:container/input/custom/input_noconfig
