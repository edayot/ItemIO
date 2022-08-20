scoreboard players set #valid_item itemio.math 0
data remove storage itemio:io filter
data modify storage itemio:io filter set from storage itemio:main servo_filters2[0]

data remove storage itemio:io item
data modify storage itemio:io item set from storage itemio:io output
function #itemio:event/filter
execute if score #valid_item itemio.math matches 0 run data remove storage itemio:main servo_filters2[0]
execute if score #valid_item itemio.math matches 0 if data storage itemio:main servo_filters2[0] run function itemio:container/output/try_input_after/filter