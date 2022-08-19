scoreboard players set #valid_item itemio.math 1
data modify storage itemio:io item set from storage itemio:io Item_auto_output
function #itemio:event/filter

execute if score #valid_item itemio.math matches 1 run function itemio:calls/auto_handled_output/output



