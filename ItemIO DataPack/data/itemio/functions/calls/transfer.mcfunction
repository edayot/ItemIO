#Try to transfer items between two container

# Inputs :
# Origin at the command execution
# Destinations at every marker @e[tag=itemio.transfer.destination] they should had the data.itemio.input_side in them
#   A output side in storage itemio:io output_side
#       - Can be "north","south","east","west","top","bottom"
#   score #max_output_count itemio.math.output : for unstackable or if the container that the item is going is full

#       storage itemio:io filter : work the same way as filter (custom one can be declared in function tag #itemio:event/filter)
#       storage itemio:io input : if declared the output as to match NBT with this item




scoreboard players set #success_transfer itemio.math 0

execute if entity @e[tag=itemio.transfer.destination] run function itemio:container/transfer



