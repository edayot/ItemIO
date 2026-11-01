
data remove storage itemio:main.output seen_items
data modify storage itemio:main.output seen_items set value []

scoreboard players set #good_context_entity itemio.math.output 0

# The container entity at this position, else the vanilla container
scoreboard players set #container_found itemio.math.output 0
execute
    as @e[type=#itemio:container,tag=itemio.container.initialised,distance=..0.5001,limit=1,sort=nearest]
    run function itemio:impl/container/output/dispatch:
        scoreboard players set #container_found itemio.math.output 1
        execute if entity @s[tag=itemio.container.nope] run return fail
        execute if entity @s[tag=itemio.container.auto_handled_io] run return run function itemio:impl/container/output/auto_handled
        function itemio:impl/container/output/custom/output
execute if score #container_found itemio.math.output matches 0 run function itemio:impl/container/output/repart_vanilla
