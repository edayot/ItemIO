scoreboard players set #valid_item itemio.math.output 0
data modify storage itemio:io item set from storage itemio:main.output Items[{Slot:4b}]
function #itemio:event/filter
execute if score #valid_item itemio.math.output matches 1 run function itemio:container/output/custom/try_output/4/output





