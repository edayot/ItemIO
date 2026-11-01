# @template itemio_test:simple_transfer
# @timeout 600
# Extract 1 stone with an id filter, the only stone is in the last slot
# slot 26 is topped up after each extraction (one item modify) so n is not bounded

from itemio_test:bench import bench, items_snbt

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 4t

items = items_snbt(["dirt"] * 26 + ["stone"])

def reset():
    raw f"data modify block ~ ~2 ~ Items set value {items}"

def body():
    scoreboard players set #max_output_count itemio.io 1
    data modify storage itemio:io output_side set value "wireless"
    data remove storage itemio:io input
    data modify storage itemio:io filters set value [{id:["minecraft:stone"]}]
    execute positioned ~ ~2 ~ run function #itemio:calls/output
    item modify block ~ ~2 ~ container.26 {type:"minecraft:set_count",count:64}

bench("output_vanilla_filtered", 200, body, reset)

assert result 64 run execute if items block ~ ~2 ~ container.* minecraft:stone
