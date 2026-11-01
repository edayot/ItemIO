# Loads the itemio config of the container (@s) in storage itemio:main.input config
# The config is read from data.itemio (any entity), with a fallback on the item of
# item_frames, armor_stands and item_displays (where it was stored before 2.0.0)

data modify storage itemio:main.input config set value {}
data modify storage itemio:main.input config merge from entity @s data.itemio
execute if data storage itemio:main.input config.ioconfig run return 1

execute if entity @s[type=#itemio:item_frames] run return run data modify storage itemio:main.input config merge from entity @s Item.components."minecraft:custom_data".itemio
execute if entity @s[type=armor_stand] run return run data modify storage itemio:main.input config merge from entity @s equipment.head.components."minecraft:custom_data".itemio
execute if entity @s[type=#itemio:item_display] run return run data modify storage itemio:main.input config merge from entity @s item.components."minecraft:custom_data".itemio
