
#loading ioconfig
data remove storage itemio:main.output ioconfig 
execute if entity @s[type=marker] run data modify storage itemio:main.input ioconfig set from entity @s data.itemio.ioconfig
execute if entity @s[type=#itemio:item_frame] run data modify storage itemio:main.input ioconfig set from entity @s Item.tag.itemio.ioconfig
data remove storage itemio:main.output ioconfig[{mode:"input"}]

function itemio:container/output/custom/output_noconfig
