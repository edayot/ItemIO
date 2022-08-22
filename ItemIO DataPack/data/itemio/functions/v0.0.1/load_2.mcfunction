
execute if score #loaded itemio.math matches 1 run kill 93682a08-d099-4e8f-a4a6-1e33a3692301
execute if score #loaded itemio.math matches 1 run summon armor_stand -30000000 20 1610 {Tags:["global.forceload"],NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,UUID:[I;-1821890040,-795259249,-1532617165,-1553390847],HandItems:[{id:"minecraft:stone",Count:1b},{}]}
execute if score #loaded itemio.math matches 1 run setblock -30000000 22 1610 yellow_shulker_box
execute if score #loaded itemio.math matches 1 run setblock -30000000 23 1610 barrel

scoreboard players set #loaded itemio.math 0
execute if blocks -30000000 20 1610 -30000000 20 1610 -30000000 20 1610 all run scoreboard players set #loaded itemio.math 1

execute if score #loaded itemio.math matches 0 run schedule function itemio:v0.0.1/load_2 5t

