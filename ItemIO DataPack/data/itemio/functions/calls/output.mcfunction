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

scoreboard players set #success_output itemio.math.output 0


execute align xyz positioned ~.5 ~.5 ~.5 run tag @e[type=#itemio:container,tag=itemio.container,distance=..0.5,limit=1,sort=nearest] add itemio.selected.output
execute as @e[tag=itemio.selected.output,tag=!itemio.container.nope,tag=!itemio.auto_handled_io] run function itemio:container/output/custom/output
execute unless entity @e[tag=itemio.selected.output,tag=!itemio.container.nope,tag=!itemio.auto_handled_io] if block ~ ~ ~ #itemio:container run function itemio:container/output/vanilla/test_output
execute as @e[tag=itemio.selected.output,tag=itemio.container.auto_handled_io,tag=!itemio.container.nope] run function #itemio:event/auto_handled_output
tag @e[tag=itemio.selected.output] remove itemio.selected.output

