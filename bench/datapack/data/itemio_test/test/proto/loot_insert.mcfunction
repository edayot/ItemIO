# @template itemio_test:simple_transfer
# @timeout 600
# Prototype: vanilla insertion with `loot insert` + a slots loot entry reading the helper entity
# (replaces the yellow shulker box + barrel round trip), counting inserted items with `if items`

from itemio_test:bench import bench, items_snbt, DISTINCT_IDS

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 1t

def insert():
    data modify storage itemio:io input set value {id:"minecraft:stone",count:1}
    data modify entity a97c9c67-fde0-4b89-926d-54fa4a866004 item set from storage itemio:io input
    execute store result score #before itemio.math if items block ~ ~ ~ container.* *
    execute as a97c9c67-fde0-4b89-926d-54fa4a866004 run loot insert ~ ~ ~ loot itemio_test:bench/helper_contents
    execute store result score #after itemio.math if items block ~ ~ ~ container.* *
    scoreboard players operation #after itemio.math -= #before itemio.math

def reset_empty():
    data modify block ~ ~ ~ Items set value []

bench("proto_loot_insert", 1000, insert, reset_empty)
assert result 1000 run execute if items block ~ ~ ~ container.* minecraft:stone
assert score #after itemio.math matches 1

items = items_snbt(DISTINCT_IDS)[:-1] + ',{Slot:26b,id:"minecraft:stone",count:1}]'
def reset_scan():
    raw f"data modify block ~ ~ ~ Items set value {items}"

bench("proto_loot_insert_scan", 60, insert, reset_scan)
assert result 61 run execute if items block ~ ~ ~ container.26 minecraft:stone
