
#loading ioconfig
data remove storage itemio:main ioconfig 
data modify storage itemio:main ioconfig set from entity @s data.itemio.ioconfig
data remove storage itemio:main ioconfig[{mode:"input"}]

function itemio:container/output/custom/output_noconfig
