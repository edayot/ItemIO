
# containers initialised before 2.0.0
execute if entity @s[tag=!itemio.container.v2] run function itemio:impl/container/upgrade

execute if entity @s[tag=!itemio.container.not_vanilla_container] run function itemio:impl/container/disabling_hopper

execute
    if entity @s[scores={itemio.minecart_check=1..}]
    run function itemio:impl/container/minecart_check:
        execute if entity @s[tag=!itemio.container.not_vanilla_container] positioned ~ ~-1 ~ as @e[type=hopper_minecart,distance=..1.5,tag=!itemio.minecart_disabled] run function itemio:impl/container/disable_minecart
        scoreboard players remove @s itemio.minecart_check 1


# 8 tick
execute 
    if score #loaded itemio.math matches 1 
    if entity @s[tag=itemio.container.hopper] 
    if score @s itemio.network.process_queue = #current_queue_container itemio.math
    run function itemio:impl/container/8tick
