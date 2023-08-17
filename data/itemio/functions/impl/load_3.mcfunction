kill 93682a08-d099-4e8f-a4a6-1e33a3692301
summon armor_stand -30000000 20 1610 {Tags:["global.forceload","global.ignore"],NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,UUID:[I;-1821890040,-795259249,-1532617165,-1553390847],HandItems:[{id:"minecraft:stone",Count:1b},{}]}


setblock -30000000 22 1610 yellow_shulker_box
setblock -30000000 23 1610 barrel

execute as @a[tag=convention.debug] run function itemio:impl/print_version

scoreboard players set #loaded itemio.math 1
