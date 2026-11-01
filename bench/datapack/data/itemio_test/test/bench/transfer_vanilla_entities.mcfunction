# @template itemio_test:simple_transfer
# @timeout 600
# Same as transfer_vanilla, with 3000 unrelated markers loaded 40 blocks above
# (exposes selectors that scan every entity of the world)

from itemio_test:bench import bench, full_container

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 6t

function ~/spawn_100:
    for _ in range(100):
        summon marker ~ ~40 ~ {Tags:["bench_load"]}

for _ in range(30):
    function ~/spawn_100

summon marker ~.5 ~.5 ~.5 {Tags:["itemio.transfer.destination","bench_destination_loaded"],data:{itemio:{ioconfig:{input_side:"wireless"}}}}

def reset():
    raw f"data modify block ~ ~2 ~ Items set value {full_container('oak_planks')}"
    data modify block ~ ~ ~ Items set value []

def body():
    scoreboard players set #max_output_count itemio.io 1
    data modify storage itemio:io output_side set value "wireless"
    data remove storage itemio:io input
    data remove storage itemio:io filters
    execute positioned ~ ~2 ~ run function #itemio:calls/transfer

bench("transfer_vanilla_3k_entities", 500, body, reset)

assert result 500 run execute if items block ~ ~ ~ container.* minecraft:oak_planks
kill @e[tag=bench_destination_loaded]
kill @e[tag=bench_load]
