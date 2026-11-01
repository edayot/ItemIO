# @template itemio_test:simple_transfer
# @timeout 600
# Extract 1 item from a full vanilla barrel, no filter (first slot matches)
# slot 0 is topped up after each extraction (one item modify) so n is not bounded

from itemio_test:bench import bench, full_container

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 3t

def reset():
    raw f"data modify block ~ ~2 ~ Items set value {full_container('oak_planks')}"

def body():
    scoreboard players set #max_output_count itemio.io 1
    data modify storage itemio:io output_side set value "wireless"
    data remove storage itemio:io input
    data remove storage itemio:io filters
    execute positioned ~ ~2 ~ run function #itemio:calls/output
    item modify block ~ ~2 ~ container.0 {type:"minecraft:set_count",count:64}

bench("output_vanilla", 1000, body, reset)

assert result 1728 run execute if items block ~ ~2 ~ container.* minecraft:oak_planks
