# @template itemio_test:simple_transfer
# @timeout 600
# #itemio:calls/filters_v2 with an id filter, the item matches the last id

from itemio_test:bench import bench

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 9t

def body():
    data modify storage itemio:io filters set value [{id:["minecraft:dirt","minecraft:stone","minecraft:sand","minecraft:gravel","minecraft:oak_log"]}]
    data modify storage itemio:io item set value {id:"minecraft:oak_log",count:1}
    function #itemio:calls/filters_v2

bench("filters_id", 2000, body)

assert score #filters.valid_item itemio.io matches 1
