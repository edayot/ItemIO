# @template itemio_test:empty_5x3x5
# @timeout 200

from itemio_test:test_utils import call_input, stacks


def emit(commands):
    for command in commands:
        raw command

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


# Merge into the existing stacks first, then the first empty slot
setblock ~ ~ ~ barrel{Items:[{Slot:0b,id:"minecraft:stone",count:60},{Slot:2b,id:"minecraft:dirt",count:64},{Slot:3b,id:"minecraft:stone",count:10}]}
emit(call_input('{id:"minecraft:stone",count:10}'))
assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 10
assert result 0 run data get storage itemio:io output.count
assert data block ~ ~ ~ Items[{Slot:0b,id:"minecraft:stone",count:64}]
assert data block ~ ~ ~ Items[{Slot:1b,id:"minecraft:stone",count:6}]
assert data block ~ ~ ~ Items[{Slot:2b,id:"minecraft:dirt",count:64}]
assert data block ~ ~ ~ Items[{Slot:3b,id:"minecraft:stone",count:10}]
assert not data block ~ ~ ~ Items[4]


# Only a part of the input fits
raw f"setblock ~2 ~ ~ barrel{{Items:{stacks(['dirt'] * 26)[:-1]},{{Slot:26b,id:\"minecraft:stone\",count:60}}]}}"
emit(call_input('{id:"minecraft:stone",count:10}', pos="~2 ~ ~"))
assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 4
assert result 6 run data get storage itemio:io output.count
assert data storage itemio:io output{id:"minecraft:stone"}
assert data block ~2 ~ ~ Items[{Slot:26b,id:"minecraft:stone",count:64}]


# Nothing fits
raw f"setblock ~4 ~ ~ barrel{{Items:{stacks(['dirt'] * 27)}}}"
emit(call_input('{id:"minecraft:stone",count:5}', pos="~4 ~ ~"))
assert score #success_input itemio.io matches 0
assert score #count_to_remove itemio.io matches 0
assert result 5 run data get storage itemio:io output.count


# Hoppers: an input bigger than a stack is split, a disabled hopper refuses everything
setblock ~ ~ ~2 hopper[enabled=true]{TransferCooldown:1000}
emit(call_input('{id:"minecraft:stone",count:70}', pos="~ ~ ~2"))
assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 70
assert data block ~ ~ ~2 Items[{Slot:0b,id:"minecraft:stone",count:64}]
assert data block ~ ~ ~2 Items[{Slot:1b,id:"minecraft:stone",count:6}]

setblock ~2 ~1 ~2 redstone_block
setblock ~2 ~ ~2 hopper[enabled=false]
emit(call_input('{id:"minecraft:stone",count:1}', pos="~2 ~ ~2"))
assert score #success_input itemio.io matches 0
assert not data block ~2 ~ ~2 Items[0]


# Shulker boxes refuse shulker boxes
setblock ~4 ~ ~2 shulker_box
emit(call_input('{id:"minecraft:red_shulker_box",count:1}', pos="~4 ~ ~2"))
assert score #success_input itemio.io matches 0
assert result 1 run data get storage itemio:io output.count
assert not data block ~4 ~ ~2 Items[0]
emit(call_input('{id:"minecraft:stone",count:1}', pos="~4 ~ ~2"))
assert score #success_input itemio.io matches 1
assert data block ~4 ~ ~2 Items[{Slot:0b,id:"minecraft:stone",count:1}]


# Unstackable items take one slot each
setblock ~ ~ ~4 dispenser
emit(call_input('{id:"minecraft:diamond_sword",count:3}', pos="~ ~ ~4"))
assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 3
assert result 3 run execute if items block ~ ~ ~4 container.* minecraft:diamond_sword
assert data block ~ ~ ~4 Items[{Slot:2b,id:"minecraft:diamond_sword"}]


# Items with components only merge with identical items
setblock ~2 ~ ~4 barrel{Items:[{Slot:0b,id:"minecraft:stone",count:1,components:{"minecraft:custom_name":"a"}}]}
emit(call_input('{id:"minecraft:stone",count:1}', pos="~2 ~ ~4"))
assert data block ~2 ~ ~4 Items[{Slot:0b,count:1}]
assert data block ~2 ~ ~4 Items[{Slot:1b,id:"minecraft:stone",count:1}]
emit(call_input('{id:"minecraft:stone",count:1,components:{"minecraft:custom_name":"a"}}', pos="~2 ~ ~4"))
assert data block ~2 ~ ~4 Items[{Slot:0b,count:2}]
