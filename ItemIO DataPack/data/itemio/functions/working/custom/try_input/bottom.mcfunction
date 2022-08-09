scoreboard players set #valid_item itemio.math 1
data remove storage itemio:io filter
data modify storage itemio:io filter set from storage itemio:main ioconfig[0].filter
function #itemio:event/filter

execute if score #valid_item itemio.math matches 1 if data storage itemio:main ioconfig[0].allowed_side{bottom:1b} run function itemio:working/custom/repart
data remove storage itemio:main ioconfig[0]
execute if data storage itemio:main ioconfig[0] run function itemio:working/custom/try_input/bottom
