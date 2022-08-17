scoreboard players set #valid_item itemio.math 0
data remove storage itemio:io filter
data modify storage itemio:io filter set from entity @s data.itemio.ioconfig.filter

data remove storage itemio:io item
data modify storage itemio:io item set from storage itemio:io output
function #itemio:event/filter