scoreboard players set #filter.valid_item itemio.io 0

# filter.id is a list : a partial list match tests if the item id is in it
execute if data storage itemio:io item.id run function itemio:impl/filters/id/match with storage itemio:io item

function itemio:impl/filters/id/match:
    $execute if data storage itemio:io filter{id:["$(id)"]} run scoreboard players set #filter.valid_item itemio.io 1
