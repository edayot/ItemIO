scoreboard players set #valid_item itemio.math 0
data modify storage itemio:io item set from storage itemio:main Items[{Slot:16b}]
function #itemio:event/filter
execute if score #valid_item itemio.math matches 1 run function itemio:container/output/custom/try_output/16/output





