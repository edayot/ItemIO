scoreboard players set @s itemio.network_id.low 0
scoreboard players set @s itemio.network_id.high 0
execute align xyz positioned ~.5 ~.5 ~.5 run tag @e[type=#itemio:cables,tag=itemio.cable,distance=..0.5001,limit=1,sort=nearest] add itemio.cable.me
scoreboard players operation @s itemio.network_id.low = @e[tag=itemio.cable.me,limit=1] itemio.network_id.low
scoreboard players operation @s itemio.network_id.high = @e[tag=itemio.cable.me,limit=1] itemio.network_id.high

scoreboard players operation @s itemio.network.process_queue = @s itemio.network_id.low
scoreboard players operation @s itemio.network.process_queue %= #process_queue itemio.math

execute unless entity @e[tag=itemio.cable.me,limit=1] run scoreboard players set @s itemio.network.process_queue -1

scoreboard players set @s itemio.servo.cooldown 0


scoreboard players set @s itemio.math 0
execute unless score @s itemio.network_id.low matches 0 run scoreboard players set @s itemio.math 1
function #itemio:event/network_update
tag @e[tag=itemio.cable.me] remove itemio.cable.me
