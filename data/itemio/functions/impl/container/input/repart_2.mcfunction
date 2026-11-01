scoreboard players set #good_context_entity itemio.math.input 0

# The container entity at this position, else the vanilla container
scoreboard players set #container_found itemio.math.input 0
execute
    as @e[type=#itemio:container,tag=itemio.container.initialised,distance=..0.5001,limit=1,sort=nearest]
    run function itemio:impl/container/input/dispatch:
        scoreboard players set #container_found itemio.math.input 1
        execute if entity @s[tag=itemio.container.nope] run return fail
        execute if entity @s[tag=itemio.container.auto_handled_io] run return run function itemio:impl/container/input/auto_handled
        function itemio:impl/container/input/custom/input
execute if score #container_found itemio.math.input matches 0 run function itemio:impl/container/input/repart_vanilla
