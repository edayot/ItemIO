# @template itemio_test:simple_transfer
# @timeout 600
# Cost of the global tick with 100 vanilla-backed containers (hopper protection)
# and 100 custom containers (not_vanilla_container + hopper emulation)

from itemio_test:bench import bench, impl

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 11t

function ~/spawn:
    for _ in range(100):
        summon marker ~.5 ~1.5 ~.5 {Tags:["bench_tick_container","itemio.container"]}
    for _ in range(100):
        summon marker ~.5 ~1.5 ~.5 {Tags:["bench_tick_container","itemio.container","itemio.container.not_vanilla_container","itemio.container.hopper"]}
function ~/spawn
execute as @e[tag=bench_tick_container] run function #itemio:calls/container/init

def body():
    raw f"function {impl('tick')}"

bench("tick_200_containers", 100, body)

kill @e[tag=bench_tick_container]
