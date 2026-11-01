# @template itemio_test:simple_transfer
# @timeout 600
# Insert 1 stone into a custom container (marker + 6 input slots with an id filter)

from itemio_test:bench import bench, ioconfig_snbt

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 7t

ioconfig = ioconfig_snbt(range(6), "input", '[{id:["minecraft:stone","minecraft:dirt"]}]')

execute positioned ~.5 ~.5 ~.5 summon marker run function ~/place:
    tag @s add bench_input_custom
    tag @s add itemio.container
    tag @s add itemio.container.not_vanilla_container
    raw f"data modify entity @s data.itemio.ioconfig set value {ioconfig}"
    function #itemio:calls/container/init

def reset():
    data modify block ~ ~ ~ Items set value []

def body():
    data modify storage itemio:io input set value {id:"minecraft:stone",count:1}
    data modify storage itemio:io input_side set value "north"
    function #itemio:calls/input

bench("input_custom", 300, body, reset)

assert result 300 run execute if items block ~ ~ ~ container.* minecraft:stone
kill @e[tag=bench_input_custom]
