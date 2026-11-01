# Executed as and at each hopper minecart

execute
    positioned ~ ~1 ~
    run scoreboard players set @e[
        type=#itemio:container,
        tag=itemio.container.initialised,
        scores={itemio.minecart_check=..1},
        distance=..5
    ] itemio.minecart_check 5

execute if entity @s[tag=itemio.minecart_disabled] run function itemio:impl/container/disable_minecart
