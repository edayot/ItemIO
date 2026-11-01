# @template itemio_test:empty_5x3x5
# @timeout 200
# Custom containers: sides, modes, filters, max_stack_size and nbt_items

from itemio_test:test_utils import call_input, call_output, ALL_SIDES


def emit(commands):
    for command in commands:
        raw command

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


setblock ~ ~ ~ barrel{Items:[{Slot:1b,id:"minecraft:iron_ingot",count:3}]}
execute positioned ~.5 ~.5 ~.5 summon marker run function ~/place_sided:
    tag @s add itemio.test.custom_io
    tag @s add itemio.container
    tag @s add itemio.container.not_vanilla_container
    data modify entity @s data.itemio.ioconfig set value [
        {Slot:0b, mode:"input", allowed_side:{top:1b}},
        {Slot:1b, mode:"output", allowed_side:{bottom:1b}},
        {Slot:2b, allowed_side:{north:1b}, filters:[{id:["minecraft:dirt"]}]},
        {Slot:3b, mode:"input", allowed_side:{east:1b}, max_stack_size:16},
    ]
    function #itemio:calls/container/init

# Filtered slot
emit(call_input('{id:"minecraft:stone",count:5}', side="north"))
assert score #success_input itemio.io matches 0
assert result 5 run data get storage itemio:io output.count
emit(call_input('{id:"minecraft:dirt",count:5}', side="north"))
assert score #success_input itemio.io matches 1
assert data block ~ ~ ~ Items[{Slot:2b,id:"minecraft:dirt",count:5}]

# Input only slot, from its side only
emit(call_input('{id:"minecraft:stone",count:5}', side="bottom"))
assert score #success_input itemio.io matches 0
emit(call_input('{id:"minecraft:stone",count:5}', side="top"))
assert score #success_input itemio.io matches 1
assert data block ~ ~ ~ Items[{Slot:0b,id:"minecraft:stone",count:5}]

# max_stack_size
emit(call_input('{id:"minecraft:stone",count:20}', side="east"))
assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 16
assert result 4 run data get storage itemio:io output.count
assert data block ~ ~ ~ Items[{Slot:3b,id:"minecraft:stone",count:16}]

# wireless ignores the sides, slots are tried in the ioconfig order
emit(call_input('{id:"minecraft:stone",count:10}'))
assert data block ~ ~ ~ Items[{Slot:0b,id:"minecraft:stone",count:15}]

# Outputs
emit(call_output(side="top"))
assert score #success_output itemio.io matches 0
emit(call_output(side="bottom", max_count=2))
assert score #success_output itemio.io matches 1
assert data storage itemio:io output{id:"minecraft:iron_ingot",count:2}
assert data block ~ ~ ~ Items[{Slot:1b,count:1}]
emit(call_output(side="north"))
assert data storage itemio:io output{id:"minecraft:dirt",count:5}
assert not data block ~ ~ ~ Items[{Slot:2b}]
emit(call_output(side="wireless", filter_list='[{id:["minecraft:iron_ingot"]}]'))
assert data storage itemio:io output{id:"minecraft:iron_ingot",count:1}

# Destroyed : the barrel is a vanilla container again
execute as @n[tag=itemio.test.custom_io] run function ~/delete:
    function #itemio:calls/container/destroy
    kill @s
assert not entity @n[tag=itemio.test.custom_io,tag=itemio.container.initialised]
emit(call_input('{id:"minecraft:dirt",count:1}', side="bottom"))
assert score #success_input itemio.io matches 1
assert data block ~ ~ ~ Items[{Slot:1b,id:"minecraft:dirt",count:1}]



# Items stored in the entity itself
raw f"data modify storage itemio_test:main ioconfig set value [{{Slot:0b,allowed_side:{ALL_SIDES}}},{{Slot:1b,allowed_side:{ALL_SIDES}}}]"
execute positioned ~2.5 ~.5 ~.5 summon marker run function ~/place_nbt_items:
    tag @s add itemio.test.custom_io
    tag @s add itemio.container
    tag @s add itemio.container.not_vanilla_container
    tag @s add itemio.container.nbt_items
    data modify entity @s data.itemio.ioconfig set from storage itemio_test:main ioconfig
    data modify entity @s data.itemio.nbt_items_path set value "entity @s data.items"
    function #itemio:calls/container/init

emit(call_input('{id:"minecraft:stone",count:70}', pos="~2 ~ ~"))
assert score #success_input itemio.io matches 1
assert entity @n[tag=itemio.test.custom_io,nbt={data:{items:[{Slot:0b,id:"minecraft:stone",count:64}]}}]
assert entity @n[tag=itemio.test.custom_io,nbt={data:{items:[{Slot:1b,id:"minecraft:stone",count:6}]}}]
emit(call_input('{id:"minecraft:stone",count:1}', pos="~2 ~ ~"))
assert entity @n[tag=itemio.test.custom_io,nbt={data:{items:[{Slot:1b,id:"minecraft:stone",count:7}]}}]

emit(call_output(max_count=10, pos="~2 ~ ~"))
assert score #success_output itemio.io matches 1
assert data storage itemio:io output{id:"minecraft:stone",count:10}
assert entity @n[tag=itemio.test.custom_io,nbt={data:{items:[{Slot:0b,id:"minecraft:stone",count:54}]}}]

kill @e[tag=itemio.test.custom_io]
