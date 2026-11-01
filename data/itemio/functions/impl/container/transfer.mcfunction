# @public

#Try to transfer items between two container

# Inputs :
# Origin at the command execution
# Destinations, nearest first :
#   - storage itemio:io destinations, a list of {x, y, z, input_side} (or {dx, dy, dz, input_side} relative to the origin)
#     optional fields : filters, items (a list of exact items, ORed) and stack_limit
#     the list is consumed by the call
#   - else every marker @e[tag=itemio.transfer.destination] (a single scan), with data.itemio.input_side
#     and data.itemio.ioconfig.{input_side, filters, items}, and the score itemio.servo.stack_limit
#   A output side in storage itemio:io output_side
#       - Can be "north","south","east","west","top","bottom"
#   score #max_output_count itemio.io : for unstackable or if the container that the item is going is full

#       storage itemio:io filters : work the same way as filter (custom one can be declared in function tag #itemio:event/filter)
#       storage itemio:io input : if declared the output as to match NBT with this item



scoreboard players set #success_transfer itemio.io 0

execute if score #loaded itemio.math matches 1 run function itemio:impl/container/transfer_2
data remove storage itemio:io destinations
