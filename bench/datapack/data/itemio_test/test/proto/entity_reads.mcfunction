# @template itemio_test:simple_transfer
# @timeout 600
# Prototype: cost of reading an ioconfig from each entity location, global selector scans,
# and macro `positioned` instantiation (cache hit vs miss)

from itemio_test:bench import bench, ioconfig_snbt

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 3t

ioconfig = ioconfig_snbt(range(6), "both", '[{id:["minecraft:stone"]}]')
raw f'summon marker ~.5 ~1.5 ~.5 {{Tags:["proto_marker"],data:{{itemio:{{ioconfig:{ioconfig}}}}}}}'
raw f'summon item_display ~.5 ~1.5 ~.5 {{Tags:["proto_display"],data:{{itemio:{{ioconfig:{ioconfig}}}}},item:{{id:"minecraft:stone",count:1,components:{{"minecraft:custom_data":{{itemio:{{ioconfig:{ioconfig}}}}}}}}}}}'

def read_marker():
    data modify storage itemio_test:bench read set from entity @n[tag=proto_marker] data.itemio.ioconfig
def read_display_data():
    data modify storage itemio_test:bench read set from entity @n[tag=proto_display] data.itemio.ioconfig
def read_display_custom_data():
    data modify storage itemio_test:bench read set from entity @n[tag=proto_display] item.components."minecraft:custom_data".itemio.ioconfig
def read_display_missing_then_fallback():
    execute unless data entity @n[tag=proto_display] data.itemio.missing run data modify storage itemio_test:bench read set from entity @n[tag=proto_display] item.components."minecraft:custom_data".itemio.ioconfig
def selector_only():
    execute if entity @n[tag=proto_marker]

bench("proto_read_selector_only", 2000, selector_only)
bench("proto_read_marker_data", 2000, read_marker)
bench("proto_read_display_data", 2000, read_display_data)
bench("proto_read_display_custom_data", 2000, read_display_custom_data)
bench("proto_read_display_fallback", 2000, read_display_missing_then_fallback)

function ~/spawn_100:
    for _ in range(100):
        summon marker ~ ~40 ~ {Tags:["proto_load"]}
for _ in range(30):
    function ~/spawn_100
def global_scan():
    execute if entity @e[tag=proto_nothing]
def local_scan():
    execute if entity @e[tag=proto_nothing,distance=..0.5001]
bench("proto_global_scan_3k_entities", 2000, global_scan)
bench("proto_local_scan_3k_entities", 2000, local_scan)
kill @e[tag=proto_load]

data modify storage itemio_test:bench pos set value []
for i in range(16):
    raw f"data modify storage itemio_test:bench pos append value {{x:{i},y:0,z:0}}"
def macro_hit():
    for i in range(4):
        raw f"function itemio_test:bench/proto/macro_positioned with storage itemio_test:bench pos[{i}]"
def macro_miss():
    for i in range(16):
        raw f"function itemio_test:bench/proto/macro_positioned with storage itemio_test:bench pos[{i}]"
bench("proto_macro_positioned_hit_x4", 500, macro_hit)
bench("proto_macro_positioned_miss_x16", 125, macro_miss)

kill @e[tag=proto_marker]
kill @e[tag=proto_display]
