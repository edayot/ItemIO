# @template itemio_test:simple_transfer
# @timeout 600
# Prototype: max stack size with a clamped set_count instead of the 1..99 `if items` ladder

from itemio_test:bench import bench, impl

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 2t

def current(id):
    def body():
        raw f'data modify storage itemio:main get_stack_size set value {{id:"minecraft:{id}",count:1}}'
        raw f"execute store result score #stack itemio.math run function {impl('utils/get_stack_size')}"
    return body

def clamp(id):
    def body():
        raw f'data modify storage itemio:main get_stack_size set value {{id:"minecraft:{id}",count:1}}'
        data modify entity a97c9c67-fde0-4b89-926d-54fa4a866004 item set from storage itemio:main get_stack_size
        item modify entity a97c9c67-fde0-4b89-926d-54fa4a866004 contents {type:"minecraft:set_count",count:99}
        execute store result score #stack itemio.math if items entity a97c9c67-fde0-4b89-926d-54fa4a866004 contents *
    return body

bench("proto_stack_size_ladder_stone", 1000, current("stone"))
assert score #stack itemio.math matches 64
bench("proto_stack_size_ladder_sword", 1000, current("diamond_sword"))
assert score #stack itemio.math matches 1
bench("proto_stack_size_clamp_stone", 1000, clamp("stone"))
assert score #stack itemio.math matches 64
bench("proto_stack_size_clamp_sword", 1000, clamp("diamond_sword"))
assert score #stack itemio.math matches 1
