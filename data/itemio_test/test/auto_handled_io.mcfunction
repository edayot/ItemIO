# @template itemio_test:empty_5x3x5
# @timeout 200
# Containers handling their inputs and outputs themselves (itemio.container.auto_handled_io)
# The test container (impl/test_support) stores up to 64 stone in data.stock

from itemio_test:test_utils import call_input, call_output, call_transfer


def emit(commands):
    for command in commands:
        raw command

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


setblock ~2 ~ ~2 lodestone
execute positioned ~2.5 ~.5 ~2.5 summon marker run function ~/place:
    tag @s add itemio.test.auto_container
    tag @s add itemio.container
    tag @s add itemio.container.auto_handled_io
    tag @s add itemio.container.not_vanilla_container
    data modify entity @s data.stock set value 0
    function #itemio:calls/container/init

# Inputs : the container sets #count_to_remove itemio.io
emit(call_input('{id:"minecraft:stone",count:10}', pos="~2 ~ ~2"))
assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 10
assert result 0 run data get storage itemio:io output.count
assert entity @n[tag=itemio.test.auto_container,nbt={data:{stock:10}}]

emit(call_input('{id:"minecraft:dirt",count:10}', pos="~2 ~ ~2"))
assert score #success_input itemio.io matches 0
assert score #count_to_remove itemio.io matches 0
assert data storage itemio:io output{id:"minecraft:dirt",count:10}

emit(call_input('{id:"minecraft:stone",count:60}', pos="~2 ~ ~2"))
assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 54
assert data storage itemio:io output{id:"minecraft:stone",count:6}
assert entity @n[tag=itemio.test.auto_container,nbt={data:{stock:64}}]

# Outputs : the container offers its stacks with #itemio:calls/offer
emit(call_output(max_count=5, pos="~2 ~ ~2"))
assert score #success_output itemio.io matches 1
assert score #count_to_remove itemio.io matches 5
assert data storage itemio:io output{id:"minecraft:stone",count:5}
assert entity @n[tag=itemio.test.auto_container,nbt={data:{stock:59}}]

emit(call_output(pos="~2 ~ ~2", filter_list='[{id:["minecraft:dirt"]}]'))
assert score #success_output itemio.io matches 0
emit(call_output(max_count=1, pos="~2 ~ ~2", exact_item='{id:"minecraft:dirt",count:1}'))
assert score #success_output itemio.io matches 0
emit(call_output(max_count=1, pos="~2 ~ ~2", exact_item='{id:"minecraft:stone",count:1}'))
assert score #success_output itemio.io matches 1
assert entity @n[tag=itemio.test.auto_container,nbt={data:{stock:58}}]

# Transfers, from and to the container
setblock ~ ~ ~2 barrel
summon marker ~.5 ~.5 ~2.5 {Tags:["itemio.transfer.destination","itemio.test.auto_destination"],data:{itemio:{input_side:"wireless"}}}
emit(call_transfer(max_count=3, pos="~2 ~ ~2"))
assert score #success_transfer itemio.io matches 1
assert data block ~ ~ ~2 Items[{Slot:0b,id:"minecraft:stone",count:3}]
assert entity @n[tag=itemio.test.auto_container,nbt={data:{stock:55}}]
kill @e[tag=itemio.test.auto_destination]

setblock ~4 ~ ~2 barrel{Items:[{Slot:0b,id:"minecraft:dirt",count:2},{Slot:1b,id:"minecraft:stone",count:20}]}
summon marker ~2.5 ~.5 ~2.5 {Tags:["itemio.transfer.destination","itemio.test.auto_destination"],data:{itemio:{input_side:"wireless"}}}
emit(call_transfer(max_count=20, pos="~4 ~ ~2"))
assert score #success_transfer itemio.io matches 1
assert entity @n[tag=itemio.test.auto_container,nbt={data:{stock:64}}]
assert data block ~4 ~ ~2 Items[{Slot:0b,id:"minecraft:dirt",count:2}]
assert data block ~4 ~ ~2 Items[{Slot:1b,id:"minecraft:stone",count:11}]
kill @e[tag=itemio.test.auto_destination]

kill @e[tag=itemio.test.auto_container]
