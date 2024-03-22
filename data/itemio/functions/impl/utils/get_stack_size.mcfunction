


execute if data entity @s HandItems[0].components."minecraft:max_stack_size" run return run data get entity @s HandItems[0].components."minecraft:max_stack_size"


raw execute if items entity @s weapon *[minecraft:max_stack_size=64] run return 64
raw execute if items entity @s weapon *[minecraft:max_stack_size=16] run return 16
raw execute if items entity @s weapon *[minecraft:max_stack_size=1] run return 1


for i in range(1, 100):
    if not i in [1, 16, 64]:
        raw f"execute if items entity @s weapon *[minecraft:max_stack_size={i}] run return {i}"





