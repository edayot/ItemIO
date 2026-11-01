# @template itemio_test:simple_transfer
# @timeout 600
# Hopper emulation of a custom container: barrel(custom) -> hopper -> barrel,
# one 8-tick cycle moves 1 item in and 1 item out of the hopper

from itemio_test:bench import bench, ioconfig_snbt, full_container, impl

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 12t

setblock ~ ~1 ~ hopper[facing=down]
ioconfig = ioconfig_snbt(range(27), "both", "[]")

execute positioned ~.5 ~2.5 ~.5 summon marker run function ~/place:
    tag @s add bench_hopper_container
    tag @s add itemio.container
    tag @s add itemio.container.hopper
    raw f"data modify entity @s data.itemio.ioconfig set value {ioconfig}"
    function #itemio:calls/container/init

def reset():
    raw f"data modify block ~ ~2 ~ Items set value {full_container('oak_planks')}"
    data modify block ~ ~1 ~ Items set value []
    data modify block ~ ~ ~ Items set value []

def body():
    raw f"execute as @e[tag=bench_hopper_container,limit=1] at @s run function {impl('container/8tick')}"

bench("hopper_emulation", 300, body, reset)

assert result 300 run execute if items block ~ ~ ~ container.* minecraft:oak_planks
kill @e[tag=bench_hopper_container]
setblock ~ ~1 ~ air
