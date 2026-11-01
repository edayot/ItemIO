# @template itemio_test:empty_5x3x5
# @timeout 200
# The right half of a double chest is always used first, whatever half is targeted

from itemio_test:test_utils import call_input, call_output, stacks


def emit(commands):
    for command in commands:
        raw command

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


# facing north: the right half is at +x of the left half
setblock ~ ~ ~ chest[facing=north,type=left]
setblock ~1 ~ ~ chest[facing=north,type=right]
# facing east: the right half is at +z of the left half
setblock ~4 ~ ~ chest[facing=east,type=left]
setblock ~4 ~ ~1 chest[facing=east,type=right]


for left, right in [("~ ~ ~", "~1 ~ ~"), ("~4 ~ ~", "~4 ~ ~1")]:
    emit(call_input('{id:"minecraft:stone",count:1}', pos=left))
    assert score #success_input itemio.io matches 1
    raw f"assert data block {right} Items[{{Slot:0b,id:\"minecraft:stone\",count:1}}]"
    raw f"assert not data block {left} Items[0]"

    emit(call_input('{id:"minecraft:stone",count:1}', pos=right))
    raw f"assert data block {right} Items[{{Slot:0b,id:\"minecraft:stone\",count:2}}]"

    # the right half is full: the left half is used
    raw f"data modify block {right} Items set value {stacks(['dirt'] * 27)}"
    emit(call_input('{id:"minecraft:stone",count:1}', pos=left))
    assert score #success_input itemio.io matches 1
    raw f"assert data block {left} Items[{{Slot:0b,id:\"minecraft:stone\",count:1}}]"
    emit(call_input('{id:"minecraft:stone",count:1}', pos=right))
    raw f"assert data block {left} Items[{{Slot:0b,id:\"minecraft:stone\",count:2}}]"


# Output, north facing: the right half first, from both halves
data modify block ~ ~ ~ Items set value [{Slot:4b,id:"minecraft:dirt",count:5}]
data modify block ~1 ~ ~ Items set value [{Slot:2b,id:"minecraft:stone",count:5}]
emit(call_output(max_count=1, pos="~ ~ ~"))
assert score #success_output itemio.io matches 1
assert data storage itemio:io output{id:"minecraft:stone",count:1}
emit(call_output(max_count=1, pos="~1 ~ ~"))
assert data storage itemio:io output{id:"minecraft:stone",count:1}
assert data block ~1 ~ ~ Items[{Slot:2b,count:3}]

data modify block ~1 ~ ~ Items set value []
emit(call_output(max_count=1, pos="~ ~ ~"))
assert score #success_output itemio.io matches 1
assert data storage itemio:io output{id:"minecraft:dirt",count:1}
emit(call_output(max_count=1, pos="~1 ~ ~"))
assert score #success_output itemio.io matches 1
assert data storage itemio:io output{id:"minecraft:dirt",count:1}
assert data block ~ ~ ~ Items[{Slot:4b,count:3}]


# Output, east facing (the left half is at -z of the right half)
data modify block ~4 ~ ~ Items set value [{Slot:4b,id:"minecraft:dirt",count:5}]
data modify block ~4 ~ ~1 Items set value []
emit(call_output(max_count=1, pos="~4 ~ ~1"))
assert score #success_output itemio.io matches 1
assert data storage itemio:io output{id:"minecraft:dirt",count:1}
emit(call_output(max_count=1, pos="~4 ~ ~"))
assert score #success_output itemio.io matches 1
assert data block ~4 ~ ~ Items[{Slot:4b,count:3}]
