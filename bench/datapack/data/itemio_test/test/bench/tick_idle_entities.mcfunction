# @template itemio_test:simple_transfer
# @timeout 600
# Fixed cost of the global tick in a world with 3000 unrelated entities and no ItemIO entity
# (every selector without a position scans all the loaded entities)

from itemio_test:bench import bench, impl

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 16t

function ~/spawn_100:
    for _ in range(100):
        summon marker ~ ~40 ~ {Tags:["bench_idle_load"]}
for _ in range(30):
    function ~/spawn_100

def body():
    raw f"function {impl('tick')}"

bench("tick_idle_3k_entities", 200, body)

kill @e[tag=bench_idle_load]
