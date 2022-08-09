#Take the storage itemio:io input and try to input it at the block
#define storage itemio:io

tag @e[type=marker,tag=itemio.container,distance=..1,limit=1,sort=nearest] add itemio.selected
execute as @e[tag=itemio.selected] run function itemio:container/working/custom/input
execute unless entity @e[tag=itemio.selected] if block ~ ~ ~ #itemio:container run function itemio:container/working/vanilla/input
tag @e[tag=itemio.selected] remove itemio.selected

