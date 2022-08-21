
execute if entity @s[tag=!itemio.container.not_vanilla_container] run function itemio:container/disabling_hopper


execute positioned ~ ~-1 ~ as @e[type=hopper_minecart,distance=..1,tag=!itemio.minecart_disabled] run function itemio:container/disable_minecart

execute if entity @s[tag=itemio.container.initialised] if predicate itemio:internal/good_queue_container run function itemio:container/8tick