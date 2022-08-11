
#loading ioconfig
data remove storage itemio:main.output ioconfig 
data modify storage itemio:main.output ioconfig set from entity @s data.itemio.ioconfig
data remove storage itemio:main.output ioconfig[{mode:"input"}]

function itemio:container/output/custom/output_noconfig
