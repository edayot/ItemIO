# @template itemio:simple_network
# @timeout 999999

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


fill ~ ~ ~ ~5 ~3 ~0 command_block{Command:"summon minecraft:item_display ~ ~ ~ {Tags:[\"dummy_cable\",\"itemio.cable\"]}",auto:1b} replace conduit

await delay 1t

tag @e[tag=dummy_cable, dx=5, dy=3, dz=0] add my_cables
tag @e[type=item_frame, dx=5, dy=3, dz=0] add my_servo

execute as @e[tag=my_cables] at @s run setblock ~ ~ ~ minecraft:conduit[waterlogged=false]
execute as @e[tag=my_cables] run data modify entity @s item set value {id: "minecraft:light_gray_stained_glass_pane", count: 1}
execute as @e[tag=my_cables,sort=random] run function #itemio:calls/cables/init


scoreboard players operation #network_id itemio.network_id.low = @n[tag=my_cables] itemio.network_id.low
execute as @e[tag=my_cables] run assert score @s itemio.network_id.low = #network_id itemio.network_id.low


execute as @e[tag=my_servo] if items entity @s contents red_wool run tag @s add itemio.servo
execute as @e[tag=my_servo] if items entity @s contents lime_wool run tag @s add itemio.servo
execute as @e[tag=my_servo] if items entity @s contents red_wool run tag @s add itemio.servo.extract
execute as @e[tag=my_servo] if items entity @s contents lime_wool run tag @s add itemio.servo.insert

execute as @e[tag=my_servo] run scoreboard players set @s itemio.servo.stack_limit 1
execute as @e[tag=my_servo] run scoreboard players set @s itemio.servo.retry_limit 32

execute as @e[tag=my_servo] run function #itemio:calls/servos/init

tag @e[tag=my_cables] remove my_cables
tag @e[tag=my_servo] remove my_servo


await delay 10s

assert block ~ ~ ~ minecraft:dispenser[facing=up,triggered=false]{Items:[],components:{}}
assert not data block ~ ~ ~ Items[0]

assert block ~4 ~2 ~ minecraft:dispenser[facing=up,triggered=false]{Items:[{Slot:0b,count:1,id:"minecraft:black_wool"},{Slot:1b,count:2,id:"minecraft:waxed_weathered_copper_lantern"},{Slot:2b,count:2,id:"minecraft:crafting_table"},{Slot:3b,count:1,id:"minecraft:lantern"},{Slot:4b,count:1,id:"minecraft:cartography_table"},{Slot:7b,count:1,id:"minecraft:crafting_table"}],components:{}}
assert not data block ~ ~ ~ Items[6]
