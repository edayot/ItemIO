# @template itemio_test:empty_5x3x5
# @timeout 200
# #itemio:calls/transfer with marker destinations: nearest first, filters, items, stack_limit

from itemio_test:test_utils import call_transfer


def emit(commands):
    for command in commands:
        raw command

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


setblock ~2 ~ ~2 barrel{Items:[{Slot:0b,id:"minecraft:dirt",count:10},{Slot:1b,id:"minecraft:stone",count:10}]}
setblock ~1 ~ ~2 barrel
setblock ~4 ~ ~2 barrel
setblock ~2 ~2 ~2 furnace

# a destination at the source position is ignored
summon marker ~2.5 ~.5 ~2.5 {Tags:["itemio.transfer.destination","itemio.test.destination"]}
summon marker ~1.5 ~.5 ~2.5 {Tags:["itemio.transfer.destination","itemio.test.destination","itemio.test.near"],data:{itemio:{ioconfig:{input_side:"wireless",filters:[{id:["minecraft:dirt"]}]}}}}
summon marker ~4.5 ~.5 ~2.5 {Tags:["itemio.transfer.destination","itemio.test.destination","itemio.test.far"],data:{itemio:{ioconfig:{input_side:"wireless"}}}}

# nearest destination first
emit(call_transfer(pos="~2 ~ ~2"))
assert score #success_transfer itemio.io matches 1
assert data block ~1 ~ ~2 Items[{Slot:0b,id:"minecraft:dirt",count:1}]
assert data block ~2 ~ ~2 Items[{Slot:0b,count:9}]

# the nearest one refuses dirt now: the next one is used
data modify entity @n[tag=itemio.test.near] data.itemio.ioconfig.filters set value [{id:["minecraft:stone"]}]
emit(call_transfer(pos="~2 ~ ~2"))
assert data block ~4 ~ ~2 Items[{Slot:0b,id:"minecraft:dirt",count:1}]

# items: exact item list of a destination
data remove entity @n[tag=itemio.test.near] data.itemio.ioconfig.filters
data modify entity @n[tag=itemio.test.near] data.itemio.ioconfig.items set value [{id:"minecraft:diamond",count:1},{id:"minecraft:dirt",count:1}]
emit(call_transfer(pos="~2 ~ ~2"))
assert data block ~1 ~ ~2 Items[{Slot:0b,id:"minecraft:dirt",count:2}]
data modify entity @n[tag=itemio.test.near] data.itemio.ioconfig.items set value [{id:"minecraft:diamond",count:1}]
emit(call_transfer(pos="~2 ~ ~2"))
assert data block ~4 ~ ~2 Items[{Slot:0b,id:"minecraft:dirt",count:2}]
data modify entity @n[tag=itemio.test.near] data.itemio.ioconfig.items append value {id:"minecraft:dirt",count:1}

# stack_limit of a destination limits what is moved
scoreboard players set @n[tag=itemio.test.near] itemio.servo.stack_limit 2
emit(call_transfer(max_count=5, pos="~2 ~ ~2"))
assert data block ~1 ~ ~2 Items[{Slot:0b,id:"minecraft:dirt",count:4}]
assert data block ~2 ~ ~2 Items[{Slot:0b,count:4}]

# a transfer filter
data remove entity @n[tag=itemio.test.near] data.itemio.ioconfig.items
data modify entity @n[tag=itemio.test.near] data.itemio.ioconfig.filters set value [{id:["minecraft:dirt"]}]
emit(call_transfer(pos="~2 ~ ~2", filter_list='[{id:["minecraft:stone"]}]'))
assert data block ~4 ~ ~2 Items[{Slot:1b,id:"minecraft:stone",count:1}]

# input side of the destination
kill @e[tag=itemio.test.destination]
summon marker ~2.5 ~2.5 ~2.5 {Tags:["itemio.transfer.destination","itemio.test.destination"],data:{itemio:{ioconfig:{input_side:"top"}}}}
emit(call_transfer(pos="~2 ~ ~2"))
assert data block ~2 ~2 ~2 Items[{Slot:0b,id:"minecraft:dirt",count:1}]

# nothing accepts
data modify entity @n[tag=itemio.test.destination] data.itemio.ioconfig.filters set value [{id:["minecraft:diamond"]}]
emit(call_transfer(pos="~2 ~ ~2"))
assert score #success_transfer itemio.io matches 0
assert data block ~2 ~ ~2 Items[{Slot:0b,count:3}]

kill @e[tag=itemio.test.destination]
