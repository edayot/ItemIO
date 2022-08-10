#Take the storage itemio:io input and if nbt match then output
#The nbt match is overide if no input (do /data remove storage itemio:io input)
#the output max count as to be declare in /scoreboard players set #max_output_count itemio.math
#define storage itemio:io

execute align xyz positioned ~.5 ~.5 ~.5 run tag @e[type=marker,tag=itemio.container,distance=..0.5,limit=1,sort=nearest] add itemio.selected
execute as @e[tag=itemio.selected] run function itemio:container/output/custom/output
execute unless entity @e[tag=itemio.selected] if block ~ ~ ~ #itemio:container run function itemio:container/output/vanilla/output
tag @e[tag=itemio.selected] remove itemio.selected

