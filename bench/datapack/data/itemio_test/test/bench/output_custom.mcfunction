# @template itemio_test:simple_transfer
# @timeout 600
# Extract 1 item from a custom container (marker + 6 output slots with an id filter)
# slot 0 is topped up after each extraction (one item modify): once slot 0 is empty,
# 1.8.1 reports a success without any output instead of moving to the next slot

from itemio_test:bench import bench, ioconfig_snbt, full_container

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 8t

ioconfig = ioconfig_snbt(range(6), "output", '[{id:["minecraft:oak_planks"]}]')

execute positioned ~.5 ~2.5 ~.5 summon marker run function ~/place:
    tag @s add bench_output_custom
    tag @s add itemio.container
    tag @s add itemio.container.not_vanilla_container
    raw f"data modify entity @s data.itemio.ioconfig set value {ioconfig}"
    function #itemio:calls/container/init

def reset():
    raw f"data modify block ~ ~2 ~ Items set value {full_container('oak_planks')}"

def body():
    scoreboard players set #max_output_count itemio.io 1
    data modify storage itemio:io output_side set value "north"
    data remove storage itemio:io input
    data remove storage itemio:io filters
    execute positioned ~ ~2 ~ run function #itemio:calls/output
    item modify block ~ ~2 ~ container.0 {type:"minecraft:set_count",count:64}

bench("output_custom", 1000, body, reset)

assert result 1728 run execute if items block ~ ~2 ~ container.* minecraft:oak_planks
kill @e[tag=bench_output_custom]
