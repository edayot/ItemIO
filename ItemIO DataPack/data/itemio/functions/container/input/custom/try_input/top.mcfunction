scoreboard players set #valid_item itemio.math.input 1
data remove storage itemio:io filter
data modify storage itemio:io filter set from storage itemio:main.input ioconfig[0].filter
data modify storage itemio:io item set from storage itemio:io input
function #itemio:event/filter
execute if score #valid_item itemio.math.input matches 1 if data storage itemio:main.input ioconfig[0].allowed_side{top:1b} run function itemio:container/input/custom/repart
data remove storage itemio:main.input ioconfig[0]
execute if data storage itemio:main.input ioconfig[0] run function itemio:container/input/custom/try_input/top
