# @template itemio_test:simple_transfer
# @timeout 600
# Transfer 1 item barrel -> barrel through a marker destination

from itemio_test:bench import bench, full_container

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 5t

summon marker ~.5 ~.5 ~.5 {Tags:["itemio.transfer.destination","bench_destination_plain"],data:{itemio:{ioconfig:{input_side:"wireless"}}}}

def reset():
    raw f"data modify block ~ ~2 ~ Items set value {full_container('oak_planks')}"
    data modify block ~ ~ ~ Items set value []

def body():
    scoreboard players set #max_output_count itemio.io 1
    data modify storage itemio:io output_side set value "wireless"
    data remove storage itemio:io input
    data remove storage itemio:io filters
    execute positioned ~ ~2 ~ run function #itemio:calls/transfer

bench("transfer_vanilla", 1000, body, reset)

assert result 1000 run execute if items block ~ ~ ~ container.* minecraft:oak_planks
kill @e[tag=bench_destination_plain]
