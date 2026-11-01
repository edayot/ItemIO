function itemio:impl/container/hopper_v2/extract_top

# The hopper (~ ~ ~) pushes an item in the block it is facing
data modify storage itemio:io destinations set value [{dx:1,dy:0,dz:0,input_side:"west"}]
scoreboard players set #max_output_count itemio.io 1
data remove storage itemio:io filters
data remove storage itemio:io input
data modify storage itemio:io output_side set value "east"
function itemio:impl/container/transfer
