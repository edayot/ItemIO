scoreboard players set #valid_item itemio.math 1
data modify storage itemio:io item set from storage itemio:main.output Items[{Slot:18b}]
function #itemio:event/filter
execute if score #valid_item itemio.math matches 1 run function itemio:v0.0.1/container/output/custom/try_output/18/output




