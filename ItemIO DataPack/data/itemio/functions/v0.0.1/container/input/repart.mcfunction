#define storage itemio:io
#define storage itemio:main.input

scoreboard players set #success_input itemio.math.input 0

execute align xyz positioned ~.5 ~.5 ~.5 run tag @e[type=#itemio:container,tag=itemio.container,distance=..0.5,limit=1,sort=nearest] add itemio.selected.input
execute as @e[tag=itemio.selected.input,tag=!itemio.container.nope] run function itemio:v0.0.1/container/input/custom/input
execute unless entity @e[tag=itemio.selected.input,tag=!itemio.container.nope] if block ~ ~ ~ #itemio:container run function itemio:v0.0.1/container/input/vanilla/test_input
execute as @e[tag=itemio.selected.input,tag=itemio.container.auto_handled_io,tag=!itemio.container.nope] run function #itemio:event/auto_handled_input
tag @e[tag=itemio.selected.input] remove itemio.selected.input