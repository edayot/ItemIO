# @timeout 100
# itemio:impl/utils/get_stack_size : the max stack size of storage itemio:main get_stack_size

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


# the versioning plugin only renames itemio:impl/ in the itemio namespace
get_stack_size = f"itemio:v{ctx.project_version}/utils/get_stack_size"

def check(item, expected):
    raw f"data modify storage itemio:main get_stack_size set value {item}"
    raw f"execute store result score #test_stack_size itemio.math run function {get_stack_size}"
    raw f"assert score #test_stack_size itemio.math matches {expected}"


# default max stack sizes
check('{id:"minecraft:stone",count:1}', 64)
check('{id:"minecraft:ender_pearl",count:1}', 16)
check('{id:"minecraft:diamond_sword",count:1}', 1)
check('{id:"minecraft:potion",count:1,components:{"minecraft:potion_contents":{potion:"minecraft:regeneration"}}}', 1)

# the count of the item doesn't matter
check('{id:"minecraft:stone",count:70}', 64)
check('{id:"minecraft:stone",count:200}', 64)
check('{id:"minecraft:stone"}', 64)

# the minecraft:max_stack_size component
check('{id:"minecraft:stone",count:1,components:{"minecraft:max_stack_size":32}}', 32)
check('{id:"minecraft:stone",count:1,components:{"minecraft:max_stack_size":99}}', 99)
check('{id:"minecraft:ender_pearl",count:1,components:{"minecraft:max_stack_size":64}}', 64)

# an invalid item
check('{id:"minecraft:not_an_item",count:1}', 1)
