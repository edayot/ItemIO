
execute if entity @s[tag=!itemio.container.not_vanilla_container] run function itemio:impl/container/disabling_hopper


execute if entity @s[scores={itemio.minecart_check=1..}] positioned ~ ~-1 ~ as @e[type=hopper_minecart,distance=..1,tag=!itemio.minecart_disabled] run function itemio:impl/container/disable_minecart
scoreboard players remove @s itemio.minecart_check 1

execute if predicate itemio:internal/good_queue_container run function itemio:impl/container/8tick