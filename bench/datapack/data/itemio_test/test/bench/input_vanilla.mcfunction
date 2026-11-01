# @template itemio_test:simple_transfer
# @timeout 600
# Insert 1 stone into a vanilla barrel that has room (fast path)

from itemio_test:bench import bench

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 1t

def reset():
    data modify block ~ ~ ~ Items set value []

def body():
    data modify storage itemio:io input set value {id:"minecraft:stone",count:1}
    data modify storage itemio:io input_side set value "wireless"
    function #itemio:calls/input

bench("input_vanilla", 1000, body, reset)

assert result 1000 run execute if items block ~ ~ ~ container.* minecraft:stone
