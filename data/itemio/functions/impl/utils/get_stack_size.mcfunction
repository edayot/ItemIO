
# Receive an item in 
# storage itemio:main get_stack_size
# return the stack size of the item, with 1 as fallback
# Used entity : a97c9c67-fde0-4b89-926d-54fa4a866004


execute
    if data storage itemio:main get_stack_size.components."minecraft:max_stack_size"
    run return run data get storage itemio:main get_stack_size.components."minecraft:max_stack_size"


execute 
    as a97c9c67-fde0-4b89-926d-54fa4a866004
    run return run function ~/fallback:
        data modify entity @s item set value {id:"minecraft:stone",count:1}
        data modify entity @s item.id set from storage itemio:main get_stack_size.id

        execute if items entity @s container.0 *[minecraft:max_stack_size=64] run return 64
        execute if items entity @s container.0 *[minecraft:max_stack_size=16] run return 16
        execute if items entity @s container.0 *[minecraft:max_stack_size=1] run return 1


        for i in range(1, 100):
            if not i in [1, 16, 64]:
                raw f"execute if items entity @s container.0 *[minecraft:max_stack_size={i}] run return {i}"


        return 1

return 1

