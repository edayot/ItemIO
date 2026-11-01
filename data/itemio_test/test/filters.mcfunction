# @template itemio_test:empty_5x3x5
# @timeout 200
# #itemio:calls/filters_v2 and the integrated filters

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


def check(filters, item, expected):
    raw f"data modify storage itemio:io filters set value {filters}"
    raw f"data modify storage itemio:io item set value {item}"
    function #itemio:calls/filters_v2
    raw f"assert score #filters.valid_item itemio.io matches {expected}"


stone = '{id:"minecraft:stone",count:1}'
drawer = '{id:"minecraft:barrel",count:1,components:{"minecraft:custom_data":{ctc:{id:"drawer",from:"airdox_:simpledrawer"},smithed:{id:"simpledrawer:drawer"},energy:{}}}}'

check('[]', stone, 1)
check('[{}]', stone, 1)
check('[{id:["minecraft:dirt","minecraft:stone"]}]', stone, 1)
check('[{id:["minecraft:dirt"]}]', stone, 0)
check('[{id:["minecraft:dirt"]},{id:["minecraft:stone"]}]', stone, 1)
check('[{id:["minecraft:stone"],item_predicate:"minecraft:dirt"}]', stone, 0)

check('[{ctc:[{id:"other",from:"airdox_:simpledrawer"},{id:"drawer",from:"airdox_:simpledrawer"}]}]', drawer, 1)
check('[{ctc:[{id:"drawer",from:"other"}]}]', drawer, 0)
check('[{ctc:[{id:"drawer",from:"airdox_:simpledrawer"}]}]', stone, 0)
# an entry without id matches every item of its source
check('[{ctc:[{from:"airdox_:simpledrawer"}]}]', drawer, 1)
check('[{ctc:[{id:"other",from:"airdox_:simpledrawer"},{from:"airdox_:simpledrawer"}]}]', drawer, 1)
check('[{ctc:[{from:"other"},{id:"drawer",from:"other"}]}]', drawer, 0)
check('[{ctc:[{from:"airdox_:simpledrawer"}]}]', stone, 0)

check('[{smithed:{id:["simpledrawer:drawer"]}}]', drawer, 1)
check('[{smithed:{id:["simpledrawer:other"]}}]', drawer, 0)
check('[{smithed:{id:["simpledrawer:drawer"]}}]', stone, 0)

check('[{energy:1b}]', drawer, 1)
check('[{energy:1b}]', stone, 0)

check('[{minecraft:{base_stone_overworld:1b}}]', stone, 1)
check('[{minecraft:{logs:1b}}]', stone, 0)
check('[{item_predicate:"#minecraft:base_stone_overworld"}]', stone, 1)
check('[{merge:{components:{"minecraft:custom_data":{energy:{}}}}}]', drawer, 1)
check('[{merge:{components:{"minecraft:custom_data":{energy:{}}}}}]', stone, 0)
