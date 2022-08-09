
#tick container
execute as @e[type=marker,tag=itemio.container] at @s run function itemio:container/tick

schedule function itemio:tick 1t replace
