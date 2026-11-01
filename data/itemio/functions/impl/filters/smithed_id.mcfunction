scoreboard players set #filter.valid_item itemio.io 0

# filter.smithed.id is a list : a partial list match tests if the smithed id of the item is in it
execute if data storage itemio:io item.components."minecraft:custom_data".smithed.id run function itemio:impl/filters/smithed_id/match with storage itemio:io item.components."minecraft:custom_data".smithed

function itemio:impl/filters/smithed_id/match:
    $execute if data storage itemio:io filter.smithed{id:["$(id)"]} run scoreboard players set #filter.valid_item itemio.io 1
