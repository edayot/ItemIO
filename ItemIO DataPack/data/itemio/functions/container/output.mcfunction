
data remove storage itemio:main ioconfig 
data modify storage itemio:main ioconfig set from entity @s data.itemio.ioconfig
data remove storage itemio:main ioconfig[{mode:"input"}]

execute at @s run data modify storage itemio:main Items set from block ~ ~ ~ Items

execute if data storage itemio:main ioconfig[0] at @s align xyz positioned ~.5 ~.5 ~.5 run function itemio:container/output/try