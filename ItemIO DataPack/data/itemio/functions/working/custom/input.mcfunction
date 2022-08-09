
#loading ioconfig
data remove storage itemio:main ioconfig 
data modify storage itemio:main ioconfig set from entity @s data.itemio.ioconfig
data remove storage itemio:main ioconfig[{mode:"output"}]

function itemio:working/custom/input_noconfig
