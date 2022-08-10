
data remove storage itemio:main ioconfig2 
data modify storage itemio:main ioconfig2 set from entity @s data.itemio.ioconfig
data remove storage itemio:main ioconfig2[{mode:"input"}]

execute at @s run data modify storage itemio:main Items2 set from block ~ ~ ~ Items

execute if data storage itemio:main ioconfig2[0] at @s align xyz positioned ~.5 ~.5 ~.5 run function itemio:container/auto_eject/try