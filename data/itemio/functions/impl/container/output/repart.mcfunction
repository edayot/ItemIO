# @public
#define storage itemio:io
#define storage itemio:main.output
#Try to output a item from a container
# Inputs :
#       storage itemio:io filters 
#       storage itemio:io input : if declared the output as to match NBT with this item
#       score #max_output_count itemio.io : for unstackable or if the container that the item is going is full
#   A output side in storage itemio:io output_side
#       - Can be "north","south","east","west","top","bottom"
# Outputs : 
#       storage itemio:io output : the output item


scoreboard players set #success_output itemio.io 0

execute 
    if score #loaded itemio.math matches 1
    align xyz positioned ~.5 ~.5 ~.5
    run function itemio:impl/container/output/repart_2
