
# Inserts storage itemio:io input in the slots of storage itemio:main.input config.ioconfig
# #good_context_entity is 1 when executed as a custom container (nbt_items is allowed)

sides = ["north", "south", "east", "west", "top", "bottom"]


scoreboard players set #nbt_items itemio.math.input 0
execute if score #good_context_entity itemio.math.input matches 1 if entity @s[tag=itemio.container.nbt_items] run scoreboard players set #nbt_items itemio.math.input 1

data remove storage itemio:main.input input
data modify storage itemio:main.input input set from storage itemio:io input


# Slots usable from this side, in the ioconfig order
data modify storage itemio:main.input slots set value []
for side in sides:
    raw f"execute if data storage itemio:io {{input_side:\"{side}\"}} run data modify storage itemio:main.input slots append from storage itemio:main.input config.ioconfig[{{allowed_side:{{{side}:1b}}}}]"
execute if data storage itemio:io {input_side:"wireless"} run data modify storage itemio:main.input slots set from storage itemio:main.input config.ioconfig
execute unless data storage itemio:main.input slots[0] run return run function itemio:impl/container/input/custom/input_no_config/result


#loading items
data remove storage itemio:main.input Items
execute if score #nbt_items itemio.math.input matches 0 run data modify storage itemio:main.input Items set from block ~ ~ ~ Items
execute
    if score #nbt_items itemio.math.input matches 1
    run function itemio:impl/container/input/custom/input_no_config/load_nbt_items:
        scoreboard players set #nb_entities itemio.math.input 0
        execute if entity @s[tag=itemio.container.nbt_items.on_passengers] on passengers run function ./read with storage itemio:main.input config
        execute if entity @s[tag=itemio.container.nbt_items.on_vehicle] on vehicle run function ./read with storage itemio:main.input config
        execute if entity @s[tag=!itemio.container.nbt_items.on_passengers,tag=!itemio.container.nbt_items.on_vehicle] run function ./read with storage itemio:main.input config

        function ./read:
            $execute unless data $(nbt_items_path) run data modify $(nbt_items_path) set value []
            $data modify storage itemio:main.input Items set from $(nbt_items_path)
            scoreboard players add #nb_entities itemio.math.input 1
execute if score #nbt_items itemio.math.input matches 1 unless score #nb_entities itemio.math.input matches 1 run return run function itemio:impl/container/input/custom/input_no_config/result
data remove storage itemio:main.input Items[{components:{"minecraft:custom_data":{itemio:{gui:1b}}}}]


# The max stack size of the input is the same for all the slots
data modify storage itemio:main get_stack_size set from storage itemio:main.input input
execute store result score #stack_size itemio.math.input run function itemio:impl/utils/get_stack_size

execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.count
execute if score #count_input itemio.math.input matches 1.. run function itemio:impl/container/input/custom/input_no_config/loop

function itemio:impl/container/input/custom/input_no_config/result
