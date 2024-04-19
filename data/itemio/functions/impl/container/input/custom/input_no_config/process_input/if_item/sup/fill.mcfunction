$execute store result storage itemio:main.input Items[{Slot:$(Slot)b}].count int 1 run scoreboard players get #full_stack itemio.math.input
$execute if score #nbt_items itemio.math.input matches 0 store result block ~ ~ ~ Items[{Slot:$(Slot)b}].count int 1 run scoreboard players get #full_stack itemio.math.input
execute if score #nbt_items itemio.math.input matches 1 run function ~/nbt_items with storage itemio:main.input temp.args

function ~/nbt_items:
    $execute if entity @s[tag=itemio.container.nbt_items.on_passengers] on passengers store result $(nbt_items_path)[{Slot:$(Slot)b}].count int 1 run scoreboard players get #full_stack itemio.math.input
    $execute if entity @s[tag=itemio.container.nbt_items.on_vehicle] on vehicle store result $(nbt_items_path)[{Slot:$(Slot)b}].count int 1 run scoreboard players get #full_stack itemio.math.input
    $execute if entity @s[tag=!itemio.container.nbt_items.on_vehicle,tag=!itemio.container.nbt_items.on_passengers] store result $(nbt_items_path)[{Slot:$(Slot)b}].count int 1 run scoreboard players get #full_stack itemio.math.input

scoreboard players set #new_count_input itemio.math.input 0
scoreboard players operation #new_count_input itemio.math.input = #new_count_container itemio.math.input
scoreboard players operation #new_count_input itemio.math.input -= #full_stack itemio.math.input
execute store result storage itemio:main.input input.count int 1 run scoreboard players get #new_count_input itemio.math.input

scoreboard players set #success_input itemio.io 1


