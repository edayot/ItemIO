
#tick container
execute as @e[type=marker,tag=itemio.container] at @s run function itemio:container/tick
execute as @e[type=hopper_minecart,tag=itemio.minecart_disabled] at @s positioned ~ ~1 ~ unless entity @e[type=marker,tag=itemio.container,distance=..1] run function itemio:container/working/enable_minecart

schedule function itemio:tick 1t replace
