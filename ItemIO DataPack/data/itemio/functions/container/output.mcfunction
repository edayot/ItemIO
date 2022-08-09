
data remove storage itemio:main ioconfig 
data modify storage itemio:main ioconfig set from entity @s data.itemio.ioconfig
data remove storage itemio:main ioconfig[{mode:"input"}]

execute if data storage itemio:main ioconfig[0] run function itemio:container/output/try_output