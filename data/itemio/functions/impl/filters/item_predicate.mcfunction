

scoreboard players set #filter.valid_item itemio.io 0

data modify entity @s equipment.mainhand set value {id:"minecraft:air",count:1}
data modify entity @s equipment.mainhand set from storage itemio:io item

$execute if items entity @s weapon $(item_predicate) run scoreboard players set #filter.valid_item itemio.io 1
