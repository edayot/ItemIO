#Try to transfer items between two container

# Inputs :
# Origin at [I;0,2032945271,-1772832640,1521875159]
# Destination at [I;1,2032945271,-1772832640,1521875159]
#   A input side in storage itemio:io input_side
#       - Can be "north","south","east","west","top","bottom"
#   A output side in storage itemio:io output_side
#       - Can be "north","south","east","west","top","bottom"
#   score #max_output_count itemio.math.output : for unstackable or if the container that the item is going is full




scoreboard players set #success_transfer itemio.math 0

scoreboard players set #try_input_after itemio.math.output 1
execute at 00000000-792c-4877-9654-b8805ab5f8d7 run function #itemio:calls/output

scoreboard players set #try_input_after itemio.math.output 0
#kill 00000000-792c-4877-9654-b8805ab5f8d7
#kill 00000001-792c-4877-9654-b8805ab5f8d7