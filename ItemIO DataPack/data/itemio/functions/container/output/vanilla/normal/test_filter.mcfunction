scoreboard players set #valid_item itemio.math.output 0
data modify storage itemio:io item set from storage itemio:main.output Items[0]
function #itemio:event/filter
execute if score #valid_item itemio.math.output matches 0 run data remove storage itemio:main.output Items[0]
execute if score #valid_item itemio.math.output matches 0 if data storage itemio:main.output Items[0] run function itemio:container/output/vanilla/normal/test_filter
execute if score #valid_item itemio.math.output matches 1 run function itemio:container/output/vanilla/normal/output


