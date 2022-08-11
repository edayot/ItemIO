
#loading ioconfig
data remove storage itemio:main.input ioconfig 
data modify storage itemio:main.input ioconfig set from entity @s data.itemio.ioconfig
data remove storage itemio:main.input ioconfig[{mode:"output"}]

function itemio:container/input/custom/input_noconfig
