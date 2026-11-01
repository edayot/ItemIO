# @template itemio_test:simple_transfer
# @timeout 600
# Global tick cost per container kind: 100 vanilla-backed containers (hopper protection)
# then 100 custom containers (not_vanilla_container + hopper emulation queue)

from itemio_test:bench import bench, impl

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 14t

def body():
    raw f"function {impl('tick')}"

function ~/spawn_vanilla:
    for _ in range(100):
        summon marker ~.5 ~1.5 ~.5 {Tags:["bench_split_container","itemio.container"]}
function ~/spawn_vanilla
execute as @e[tag=bench_split_container] run function #itemio:calls/container/init
bench("tick_100_vanilla_containers", 100, body)
kill @e[tag=bench_split_container]

function ~/spawn_custom:
    for _ in range(100):
        summon marker ~.5 ~1.5 ~.5 {Tags:["bench_split_container","itemio.container","itemio.container.not_vanilla_container","itemio.container.hopper"]}
function ~/spawn_custom
execute as @e[tag=bench_split_container] run function #itemio:calls/container/init
bench("tick_100_custom_containers", 100, body)
kill @e[tag=bench_split_container]
