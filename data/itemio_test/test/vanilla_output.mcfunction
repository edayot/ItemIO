# @template itemio_test:empty_5x3x5
# @timeout 200

from itemio_test:test_utils import call_input, call_output


def emit(commands):
    for command in commands:
        raw command

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


# First stack in slot order, limited by #max_output_count, removed from the container
setblock ~ ~ ~ barrel{Items:[{Slot:3b,id:"minecraft:dirt",count:10},{Slot:5b,id:"minecraft:stone",count:20}]}
emit(call_output(max_count=4))
assert score #success_output itemio.io matches 1
assert data storage itemio:io output{id:"minecraft:dirt",count:4}
assert data block ~ ~ ~ Items[{Slot:3b,count:6}]

# Filters
emit(call_output(max_count=4, filter_list='[{id:["minecraft:stone"]}]'))
assert score #success_output itemio.io matches 1
assert data storage itemio:io output{id:"minecraft:stone",count:4}
assert data block ~ ~ ~ Items[{Slot:5b,count:16}]

# Filters are ORed
emit(call_output(max_count=1, filter_list='[{id:["minecraft:diamond"]},{id:["minecraft:stone"]}]'))
assert data storage itemio:io output{id:"minecraft:stone",count:1}

# A filter is ANDed
emit(call_output(max_count=1, filter_list='[{id:["minecraft:stone"],minecraft:{logs:1b}}]'))
assert score #success_output itemio.io matches 0

# Item tag and item predicate filters
emit(call_output(max_count=1, filter_list='[{minecraft:{dirt:1b}}]'))
assert data storage itemio:io output{id:"minecraft:dirt",count:1}
emit(call_output(max_count=1, filter_list='[{item_predicate:"minecraft:stone"}]'))
assert data storage itemio:io output{id:"minecraft:stone",count:1}

# Exact item
emit(call_output(max_count=64, exact_item='{id:"minecraft:stone",count:1}'))
assert data storage itemio:io output{id:"minecraft:stone",count:14}
assert not data block ~ ~ ~ Items[{Slot:5b}]

# Nothing matches
emit(call_output(max_count=1, filter_list='[{id:["minecraft:diamond"]}]'))
assert score #success_output itemio.io matches 0
assert data block ~ ~ ~ Items[{Slot:3b,count:5}]


# Empty container
setblock ~2 ~ ~ barrel
emit(call_output(max_count=1, pos="~2 ~ ~"))
assert score #success_output itemio.io matches 0


# Furnaces: inputs and outputs depend on the side
setblock ~4 ~ ~ furnace
emit(call_input('{id:"minecraft:raw_iron",count:3}', side="top", pos="~4 ~ ~"))
assert data block ~4 ~ ~ Items[{Slot:0b,id:"minecraft:raw_iron",count:3}]
emit(call_input('{id:"minecraft:coal",count:2}', side="north", pos="~4 ~ ~"))
assert data block ~4 ~ ~ Items[{Slot:1b,id:"minecraft:coal",count:2}]
emit(call_input('{id:"minecraft:coal",count:1}', side="bottom", pos="~4 ~ ~"))
assert data block ~4 ~ ~ Items[{Slot:1b,id:"minecraft:coal",count:3}]

data modify block ~4 ~ ~ Items append value {Slot:2b,id:"minecraft:iron_ingot",count:5}
emit(call_output(side="bottom", pos="~4 ~ ~"))
assert data storage itemio:io output{id:"minecraft:iron_ingot",count:5}
emit(call_output(side="east", max_count=1, pos="~4 ~ ~"))
assert data storage itemio:io output{id:"minecraft:coal",count:1}
emit(call_output(side="top", max_count=1, pos="~4 ~ ~"))
assert data storage itemio:io output{id:"minecraft:raw_iron",count:1}


# Brewing stands : potions from the sides, the ingredient from the top, only blaze powder as fuel
setblock ~2 ~ ~2 brewing_stand
emit(call_input('{id:"minecraft:dirt",count:1}', side="north", pos="~2 ~ ~2"))
assert score #success_input itemio.io matches 0
emit(call_input('{id:"minecraft:blaze_powder",count:2}', side="north", pos="~2 ~ ~2"))
assert data block ~2 ~ ~2 Items[{Slot:4b,id:"minecraft:blaze_powder",count:2}]
emit(call_input('{id:"minecraft:potion",count:1,components:{"minecraft:potion_contents":{potion:"minecraft:awkward"}}}', side="west", pos="~2 ~ ~2"))
assert data block ~2 ~ ~2 Items[{Slot:0b,id:"minecraft:potion",count:1}]
emit(call_input('{id:"minecraft:nether_wart",count:1}', side="top", pos="~2 ~ ~2"))
assert data block ~2 ~ ~2 Items[{Slot:3b,id:"minecraft:nether_wart",count:1}]
emit(call_output(side="bottom", pos="~2 ~ ~2"))
assert data storage itemio:io output{id:"minecraft:potion",count:1}
