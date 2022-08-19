
#tick container
execute as @e[type=#itemio:container,tag=itemio.container] at @s run function itemio:container/tick
execute as @e[type=hopper_minecart,tag=itemio.minecart_disabled] at @s run function itemio:container/disable_minecart



schedule function itemio:tick 1t replace
