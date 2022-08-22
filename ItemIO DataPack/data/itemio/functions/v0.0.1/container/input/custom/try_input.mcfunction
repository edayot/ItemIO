scoreboard players set #valid_item itemio.math 1
data remove storage itemio:io filter
data modify storage itemio:io filter set from storage itemio:main.input ioconfig[0].filter
data modify storage itemio:io item set from storage itemio:main.input input

function #itemio:event/filter

execute if score #valid_item itemio.math matches 1 run function itemio:v0.0.1/container/input/custom/repart
data remove storage itemio:main.input ioconfig[0]
execute if data storage itemio:main.input ioconfig[0] run function itemio:v0.0.1/container/input/custom/try_input
