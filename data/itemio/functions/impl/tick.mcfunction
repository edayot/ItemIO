
#should always run
scoreboard players add #global_tick itemio.math 1

#hopper minecarts : the containers above them disable them (container/tick)
# every 4 ticks : a container stays aware of a minecart for 5 ticks (itemio.minecart_check)
scoreboard players operation #minecart_tick itemio.math = #global_tick itemio.math
scoreboard players operation #minecart_tick itemio.math %= #4 itemio.math
execute if score #minecart_tick itemio.math matches 0 as @e[type=hopper_minecart] at @s run function itemio:impl/container/minecart_tick

#tick container
execute 
    as @e[type=#itemio:container,tag=itemio.container.initialised] 
    at @s run function itemio:impl/container/tick

execute if score #loaded itemio.math matches 1 run function itemio:impl/tick_if_loaded

schedule function itemio:impl/tick 1t replace
