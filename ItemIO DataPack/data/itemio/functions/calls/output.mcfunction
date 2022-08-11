#Try to output a item from a container
# Inputs :
#       storage itemio:io filter : work the same way as filter (custom one can be declared in function tag #itemio:event/filter)
#       storage itemio:io input : if declared the output as to match NBT with this item
#       score #max_output_count itemio.math.output : for unstackable or if the container that the item is going is full
#   A output side in storage itemio:io output_side
#       - Can be "north","south","east","west","top","bottom"
# Outputs : 
#       storage itemio:io output : the output item
#define storage itemio:io
#define storage itemio:main.output

execute align xyz positioned ~.5 ~.5 ~.5 run tag @e[type=marker,tag=itemio.container,distance=..0.5,limit=1,sort=nearest] add itemio.selected
execute as @e[tag=itemio.selected] run function itemio:container/output/custom/output
execute unless entity @e[tag=itemio.selected] if block ~ ~ ~ #itemio:container run function itemio:container/output/vanilla/output
tag @e[tag=itemio.selected] remove itemio.selected

