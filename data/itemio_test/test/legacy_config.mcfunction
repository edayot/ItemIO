# @template itemio_test:empty_5x3x5
# @timeout 200
# ioconfig stored in the item of item_displays, armor_stands and item_frames

from itemio_test:test_utils import call_input, call_output, ALL_SIDES


def emit(commands):
    for command in commands:
        raw command

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


raw f"data modify storage itemio_test:main legacy set value {{itemio:{{ioconfig:[{{Slot:4b,allowed_side:{ALL_SIDES},filters:[{{id:[\"minecraft:stone\"]}}]}}]}}}}"

setblock ~ ~ ~ barrel
execute positioned ~.5 ~.5 ~.5 summon item_display run function ~/place_display:
    tag @s add itemio.test.legacy
    tag @s add itemio.container
    tag @s add itemio.container.not_vanilla_container
    data modify entity @s item set value {id:"minecraft:stone",count:1,components:{"minecraft:custom_data":{}}}
    data modify entity @s item.components."minecraft:custom_data" set from storage itemio_test:main legacy
    function #itemio:calls/container/init

setblock ~2 ~ ~ barrel
execute positioned ~2.5 ~ ~.5 summon armor_stand run function ~/place_armor_stand:
    data modify entity @s NoGravity set value 1b
    tag @s add itemio.test.legacy
    tag @s add itemio.container
    tag @s add itemio.container.not_vanilla_container
    data modify entity @s equipment.head set value {id:"minecraft:stone",count:1,components:{"minecraft:custom_data":{}}}
    data modify entity @s equipment.head.components."minecraft:custom_data" set from storage itemio_test:main legacy
    function #itemio:calls/container/init

setblock ~4 ~ ~ barrel
execute positioned ~4.5 ~.5 ~.5 summon item_frame run function ~/place_frame:
    tag @s add itemio.test.legacy
    tag @s add itemio.container
    tag @s add itemio.container.not_vanilla_container
    data modify entity @s Fixed set value 1b
    data modify entity @s Item set value {id:"minecraft:stone",count:1,components:{"minecraft:custom_data":{}}}
    data modify entity @s Item.components."minecraft:custom_data" set from storage itemio_test:main legacy
    function #itemio:calls/container/init


for pos in ["~ ~ ~", "~2 ~ ~", "~4 ~ ~"]:
    emit(call_input('{id:"minecraft:dirt",count:5}', pos=pos))
    assert score #success_input itemio.io matches 0
    emit(call_input('{id:"minecraft:stone",count:5}', pos=pos))
    assert score #success_input itemio.io matches 1
    raw f"assert data block {pos} Items[{{Slot:4b,id:\"minecraft:stone\",count:5}}]"
    emit(call_output(max_count=2, pos=pos))
    assert score #success_output itemio.io matches 1
    assert data storage itemio:io output{id:"minecraft:stone",count:2}
    raw f"assert data block {pos} Items[{{Slot:4b,count:3}}]"

kill @e[tag=itemio.test.legacy]
