
execute if entity @s[tag=!itemio.container.not_vanilla_container] run function itemio:impl/container/disabling_hopper

scoreboard players add @s itemio.minecart_check 0
execute if entity @s[scores={itemio.minecart_check=1..},tag=!itemio.container.not_vanilla_container] positioned ~ ~-1 ~ as @e[type=hopper_minecart,distance=..1.5,tag=!itemio.minecart_disabled] run function itemio:impl/container/disable_minecart
scoreboard players remove @s[scores={itemio.minecart_check=1..}] itemio.minecart_check 1


# 8 tick
execute 
    if score #loaded itemio.math matches 1 
    if entity @s[tag=itemio.container.hopper] 
    if predicate itemio:impl/internal/good_queue_container 
    run function itemio:impl/container/8tick


