#Take the storage itemio:io output and try to output it at the block
#define storage itemio:io

execute align xyz positioned ~.5 ~.5 ~.5 run tag @e[type=marker,tag=itemio.container,distance=..0.5,limit=1,sort=nearest] add itemio.selected
execute as @e[tag=itemio.selected] run function itemio:container/output/custom/output
execute unless entity @e[tag=itemio.selected] if block ~ ~ ~ #itemio:container run function itemio:container/output/vanilla/output
tag @e[tag=itemio.selected] remove itemio.selected

