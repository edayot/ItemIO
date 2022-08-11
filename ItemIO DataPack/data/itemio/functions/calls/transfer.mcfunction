#Try to transfer items between two container

# Inputs :
# Origin at [I;0,2032945271,-1772832640,1521875159] // 00000000-792c-4877-9654-b8805ab5f8d7
# Destination at [I;1,2032945271,-1772832640,1521875159] // 00000001-792c-4877-9654-b8805ab5f8d7
#   A input side in storage itemio:io input_side
#       - Can be "north","south","east","west","top","bottom"
#   A output side in storage itemio:io output_side
#       - Can be "north","south","east","west","top","bottom"
#   score #max_output_count itemio.math.output : for unstackable or if the container that the item is going is full




scoreboard players set #success_transfer itemio.math 0

execute at 00000000-792c-4877-9654-b8805ab5f8d7 if entity 00000001-792c-4877-9654-b8805ab5f8d7 run function itemio:container/transfer



