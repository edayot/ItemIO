#Try to transfer items between two container

# Inputs :
# Origin at the command execution
# Destinations at every marker @e[tag=itemio.transfer.destination] they should had the data.itemio.input_side in them
#   A output side in storage itemio:io output_side
#       - Can be "north","south","east","west","top","bottom"
#   score #max_output_count itemio.math.output : for unstackable or if the container that the item is going is full

#       storage itemio:io filter : work the same way as filter (custom one can be declared in function tag #itemio:event/filter)
#       storage itemio:io input : if declared the output as to match NBT with this item






execute if score itemio.major load.status matches 0 if score itemio.minor load.status matches 0 if score itemio.patch load.status matches 1.. run function itemio:v0.0.1/container/transfer



