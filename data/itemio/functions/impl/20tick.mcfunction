execute as @e[type=hopper_minecart,tag=itemio.minecart_disabled] at @s run function itemio:impl/container/disable_minecart

schedule function itemio:impl/20tick 20t replace
