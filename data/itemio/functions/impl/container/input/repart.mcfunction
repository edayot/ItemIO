# @public
#Try to input a item in a container
# Inputs :
#   A item in storage itemio:io input
#   A input side in storage itemio:io input_side
#       - Can be "north","south","east","west","top","bottom"
# Outputs
#   A item NBT of what's left that can"t be in the container
#   A score #count_to_remove itemio.io to know how many items as to be remove from the origin
#       The item modifier itemio:input/remove_count_origin can be use to remove the good amont of item

#define storage itemio:io
#define storage itemio:main.input

scoreboard players set #success_input itemio.io 0

execute if score #loaded itemio.math matches 1 run function itemio:impl/container/input/repart_2