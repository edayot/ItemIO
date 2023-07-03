
data remove storage itemio:io filters
data modify storage itemio:io filters set from storage itemio:main.input ioconfig[0].filters
data modify storage itemio:io item set from storage itemio:main.input input

function #itemio:calls/filters_v2

execute if score #filters.valid_item itemio.io matches 1 run function itemio:impl/container/input/custom/repart
data remove storage itemio:main.input ioconfig[0]
execute if data storage itemio:main.input ioconfig[0] run function itemio:impl/container/input/custom/try_input
