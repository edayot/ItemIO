$execute if score #nbt_items itemio.math.input matches 0 run item modify block ~ ~ ~ container.$(Slot) itemio:impl/internal/input/add_count

execute if score #nbt_items itemio.math.input matches 1 run function ~/nbt_items with storage itemio:main.input temp.args

function ~/nbt_items:

    $execute if entity @s[tag=itemio.container.nbt_items.on_passengers] on passengers store result $(nbt_items_path)[{Slot:$(Slot)b}].Count byte 1 run scoreboard players get #new_count_container itemio.math.input
    $execute if entity @s[tag=itemio.container.nbt_items.on_vehicle] on vehicle store result $(nbt_items_path)[{Slot:$(Slot)b}].Count byte 1 run scoreboard players get #new_count_container itemio.math.input
    $execute if entity @s[tag=!itemio.container.nbt_items.on_vehicle,tag=!itemio.container.nbt_items.on_passengers] store result $(nbt_items_path)[{Slot:$(Slot)b}].Count byte 1 run scoreboard players get #new_count_container itemio.math.input



scoreboard players set #success_input itemio.io 1
data modify storage itemio:main.input input.Count set value 0b


