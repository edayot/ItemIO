
execute if entity @s[tag=!itemio.container.not_vanilla_container] run function itemio:v0.0.1/container/disabling_hopper


execute positioned ~ ~-1 ~ as @e[type=hopper_minecart,distance=..1,tag=!itemio.minecart_disabled] run function itemio:v0.0.1/container/disable_minecart

execute if entity @s[tag=itemio.container.initialised] if predicate itemio:internal/good_queue_container run function itemio:v0.0.1/container/8tick