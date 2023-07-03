
data remove storage itemio:io filters
data modify storage itemio:io filters set from storage itemio:main.input ioconfig[0].filters
data remove storage itemio:io item
data modify storage itemio:io item set from storage itemio:main.input input


function #itemio:calls/filters_v2

execute if score #filters.valid_item itemio.math matches 1 if data storage itemio:main.input ioconfig[0].allowed_side{east:1b} run function itemio:impl/container/input/custom/repart
execute if score #full_input itemio.math.input matches 0 run data remove storage itemio:main.input ioconfig[0]
execute if score #full_input itemio.math.input matches 0 if data storage itemio:main.input ioconfig[0] run function itemio:impl/container/input/custom/try_input/east
