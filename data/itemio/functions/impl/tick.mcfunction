
#should always run 
#tick container
execute 
    at @e[type=hopper_minecart] 
    positioned ~ ~1 ~ 
    run scoreboard players set @e[
        type=#itemio:container,
        tag=itemio.container.initialised,
        scores={itemio.minecart_check=..1}
    ] itemio.minecart_check 5 
execute 
    as @e[type=#itemio:container,tag=itemio.container.initialised] 
    at @s run function itemio:impl/container/tick
execute 
    as @e[type=hopper_minecart,tag=itemio.minecart_disabled] 
    at @s 
    run function itemio:impl/container/disable_minecart

execute if score #loaded itemio.math matches 1 run function itemio:impl/tick_2

schedule function itemio:impl/tick 1t replace
