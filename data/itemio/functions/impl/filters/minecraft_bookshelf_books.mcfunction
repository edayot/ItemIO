scoreboard players set #filter.valid_item itemio.io 0

data modify entity @s HandItems[0] set value {id:"minecraft:air"}
data modify entity @s HandItems[0] set from storage itemio:io item

execute if predicate itemio:impl/minecraft/bookshelf_books run scoreboard players set #filter.valid_item itemio.io 1



