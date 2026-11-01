
# Outputs an item from the slots of storage itemio:main.output config.ioconfig
# #good_context_entity is 1 when executed as a custom container (nbt_items is allowed)

sides = ["north", "south", "east", "west", "top", "bottom"]


scoreboard players set #nbt_items itemio.math.output 0
execute if score #good_context_entity itemio.math.output matches 1 if entity @s[tag=itemio.container.nbt_items] run scoreboard players set #nbt_items itemio.math.output 1

data remove storage itemio:main.output input
data modify storage itemio:main.output input set from storage itemio:io input
data remove storage itemio:io output

data modify storage itemio:main.output filters set value []
data modify storage itemio:main.output filters set from storage itemio:io filters

scoreboard players set #if_item_input itemio.math.output 0
scoreboard players set #if_filters_define itemio.math.output 0
execute store result score #if_filters_define itemio.math.output if data storage itemio:main.output filters[0]
execute store result score #if_item_input itemio.math.output if data storage itemio:main.output input


# Slots usable from this side, in the ioconfig order
data modify storage itemio:main.output slots set value []
for side in sides:
    raw f"execute if data storage itemio:io {{output_side:\"{side}\"}} run data modify storage itemio:main.output slots append from storage itemio:main.output config.ioconfig[{{allowed_side:{{{side}:1b}}}}]"
execute if data storage itemio:io {output_side:"wireless"} run data modify storage itemio:main.output slots set from storage itemio:main.output config.ioconfig
execute unless data storage itemio:main.output slots[0] run return 0


#loading items
data remove storage itemio:main.output Items
execute if score #nbt_items itemio.math.output matches 0 run data modify storage itemio:main.output Items set from block ~ ~ ~ Items
execute
    if score #nbt_items itemio.math.output matches 1
    run function itemio:impl/container/output/custom/output_noconfig/load_nbt_items:
        scoreboard players set #nb_entities itemio.math.output 0
        execute if entity @s[tag=itemio.container.nbt_items.on_passengers] on passengers run function ./read with storage itemio:main.output config
        execute if entity @s[tag=itemio.container.nbt_items.on_vehicle] on vehicle run function ./read with storage itemio:main.output config
        execute if entity @s[tag=!itemio.container.nbt_items.on_passengers,tag=!itemio.container.nbt_items.on_vehicle] run function ./read with storage itemio:main.output config

        function ./read:
            $execute unless data $(nbt_items_path) run data modify $(nbt_items_path) set value []
            $data modify storage itemio:main.output Items set from $(nbt_items_path)
            scoreboard players add #nb_entities itemio.math.output 1
execute if score #nbt_items itemio.math.output matches 1 unless score #nb_entities itemio.math.output matches 1 run return 0
data remove storage itemio:main.output Items[{components:{"minecraft:custom_data":{itemio:{gui:1b}}}}]

# tellraw @p [{"text":"Items : "},{"nbt":"Items","storage":"itemio:main.output"}]
# tellraw @p [{"text":"slots : "},{"nbt":"slots","storage":"itemio:main.output"}]

function itemio:impl/container/output/custom/output_noconfig/loop
