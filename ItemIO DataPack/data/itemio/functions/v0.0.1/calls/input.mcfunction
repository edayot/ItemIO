#Try to input a item in a container
# Inputs :
#   A item in storage itemio:io input
#   A input side in storage itemio:io input_side
#       - Can be "north","south","east","west","top","bottom"
# Outputs
#   A item NBT of what's left that can"t be in the container
#   A score #count_to_remove itemio.math.input to know how many items as to be remove from the origin
#       The item modifier itemio:input/remove_count_origin can be use to remove the good amont of item

execute if score itemio.major load.status matches 0 if score itemio.minor load.status matches 0 if score itemio.patch load.status matches 1 run function itemio:v0.0.1/container/input/repart
