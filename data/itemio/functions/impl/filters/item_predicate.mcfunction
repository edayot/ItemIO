

scoreboard players set #filter.valid_item itemio.io 0

data remove entity @s equipment.mainhand
data modify entity @s equipment.mainhand set from storage itemio:io item

$execute if items entity @s weapon $(item_predicate) run scoreboard players set #filter.valid_item itemio.io 1
