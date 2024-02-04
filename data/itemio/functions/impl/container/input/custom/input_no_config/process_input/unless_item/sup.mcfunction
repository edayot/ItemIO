execute store result storage itemio:main.input input.Count int 1 run scoreboard players get #full_stack itemio.math.input
execute if score #nbt_items itemio.math.input matches 0 run data modify block ~ ~ ~ Items append from storage itemio:main.input input
execute if score #nbt_items itemio.math.input matches 1 run function ~/nbt_items with storage itemio:main.input temp.args

function ~/nbt_items:
    $execute if entity @s[tag=itemio.container.nbt_items.on_passengers] on passengers run data modify $(nbt_items_path) append from storage itemio:main.input input
    $execute if entity @s[tag=itemio.container.nbt_items.on_vehicle] on vehicle run data modify $(nbt_items_path) append from storage itemio:main.input input
    $execute if entity @s[tag=!itemio.container.nbt_items.on_vehicle,tag=!itemio.container.nbt_items.on_passengers] run data modify $(nbt_items_path) append from storage itemio:main.input input

scoreboard players operation #new_count_input itemio.math.input = #count_input itemio.math.input
scoreboard players operation #new_count_input itemio.math.input -= #full_stack itemio.math.input
execute store result storage itemio:main.input input.Count int 1 run scoreboard players get #new_count_input itemio.math.input


