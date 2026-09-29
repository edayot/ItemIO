# @template itemio:chest_network
# @timeout 999999

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004

dimensions = [5,3,1]


fill ~ ~ ~ ~dimensions[0] ~dimensions[1] ~dimensions[2] command_block{Command:"summon minecraft:item_display ~ ~ ~ {Tags:[\"dummy_cable\",\"itemio.cable\"]}",auto:1b} replace conduit

await delay 1t

tag @e[tag=dummy_cable, dx=dimensions[0], dy=dimensions[1], dz=dimensions[2]] add my_cables
tag @e[type=item_frame, dx=dimensions[0], dy=dimensions[1], dz=dimensions[2]] add my_servo

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

assert block ~ ~2 ~ minecraft:chest[facing=south,type=right,waterlogged=false]{Items:[],components:{}}
assert not data block ~ ~2 ~ Items[0]
assert block ~1 ~2 ~ minecraft:chest[facing=south,type=left,waterlogged=false]{Items:[],components:{}}
assert not data block ~1 ~2 ~ Items[0]
assert block ~3 ~2 ~ minecraft:chest[facing=south,type=right,waterlogged=false]{Items:[{Slot:0b,count:1,id:"minecraft:oak_planks"},{Slot:1b,count:1,id:"minecraft:oak_planks"},{Slot:2b,count:1,id:"minecraft:oak_planks"},{Slot:3b,count:1,id:"minecraft:oak_planks"},{Slot:4b,count:1,id:"minecraft:oak_planks"},{Slot:5b,count:1,id:"minecraft:oak_planks"},{Slot:6b,count:1,id:"minecraft:oak_planks"},{Slot:7b,count:1,id:"minecraft:oak_planks"},{Slot:8b,count:1,id:"minecraft:oak_planks"},{Slot:9b,count:1,id:"minecraft:oak_planks"},{Slot:10b,count:1,id:"minecraft:oak_planks"},{Slot:11b,count:1,id:"minecraft:oak_planks"},{Slot:12b,count:1,id:"minecraft:oak_planks"},{Slot:13b,count:1,id:"minecraft:oak_planks"},{Slot:14b,count:1,id:"minecraft:oak_planks"},{Slot:15b,count:1,id:"minecraft:oak_planks"},{Slot:16b,count:1,id:"minecraft:oak_planks"},{Slot:17b,count:1,id:"minecraft:oak_planks"},{Slot:18b,count:1,id:"minecraft:oak_planks"},{Slot:19b,count:1,id:"minecraft:oak_planks"},{Slot:20b,count:1,id:"minecraft:oak_planks"},{Slot:21b,count:1,id:"minecraft:oak_planks"},{Slot:22b,count:1,id:"minecraft:oak_planks"},{Slot:23b,count:1,id:"minecraft:oak_planks"},{Slot:24b,count:1,id:"minecraft:oak_planks"},{Slot:25b,count:1,id:"minecraft:oak_planks"},{Slot:26b,count:1,id:"minecraft:oak_planks"}],components:{}}
assert block ~4 ~2 ~ minecraft:chest[facing=south,type=left,waterlogged=false]{Items:[{Slot:0b,count:1,id:"minecraft:oak_planks"},{Slot:1b,count:1,id:"minecraft:oak_planks"},{Slot:2b,count:1,id:"minecraft:oak_planks"},{Slot:3b,count:1,id:"minecraft:oak_planks"},{Slot:4b,count:1,id:"minecraft:oak_planks"},{Slot:5b,count:1,id:"minecraft:oak_planks"},{Slot:6b,count:1,id:"minecraft:oak_planks"},{Slot:7b,count:1,id:"minecraft:oak_planks"},{Slot:8b,count:1,id:"minecraft:oak_planks"},{Slot:9b,count:1,id:"minecraft:oak_planks"},{Slot:10b,count:1,id:"minecraft:oak_planks"},{Slot:11b,count:1,id:"minecraft:oak_planks"},{Slot:12b,count:1,id:"minecraft:oak_planks"},{Slot:13b,count:1,id:"minecraft:oak_planks"},{Slot:14b,count:1,id:"minecraft:oak_planks"},{Slot:15b,count:1,id:"minecraft:oak_planks"},{Slot:16b,count:1,id:"minecraft:oak_planks"},{Slot:17b,count:1,id:"minecraft:oak_planks"},{Slot:18b,count:1,id:"minecraft:oak_planks"},{Slot:19b,count:1,id:"minecraft:oak_planks"},{Slot:20b,count:1,id:"minecraft:oak_planks"},{Slot:21b,count:1,id:"minecraft:oak_planks"},{Slot:22b,count:1,id:"minecraft:oak_planks"},{Slot:23b,count:1,id:"minecraft:oak_planks"},{Slot:24b,count:1,id:"minecraft:oak_planks"},{Slot:25b,count:1,id:"minecraft:oak_planks"},{Slot:26b,count:4,id:"minecraft:chiseled_quartz_block"}],components:{}}


