# @template itemio_test:simple_transfer
# @timeout 600
# Insert 1 stone into a barrel whose only matching stack is in the last slot
# (every slot is scanned)

from itemio_test:bench import bench, items_snbt, DISTINCT_IDS

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 2t

items = items_snbt(DISTINCT_IDS)[:-1] + ',{Slot:26b,id:"minecraft:stone",count:1}]'

def reset():
    raw f"data modify block ~ ~ ~ Items set value {items}"

def body():
    data modify storage itemio:io input set value {id:"minecraft:stone",count:1}
    data modify storage itemio:io input_side set value "wireless"
    function #itemio:calls/input

bench("input_vanilla_scan", 60, body, reset)

assert result 61 run execute if items block ~ ~ ~ container.26 minecraft:stone
