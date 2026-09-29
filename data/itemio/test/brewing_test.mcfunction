# @template itemio:brewing_test
# @timeout 999999

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004

dimensions = [5,5,3]


fill ~ ~ ~ ~dimensions[0] ~dimensions[1] ~dimensions[2] command_block{Command:"summon minecraft:item_display ~ ~ ~ {Tags:[\"dummy_cable\",\"itemio.cable\"]}",auto:1b} replace conduit

await delay 1t

tag @e[tag=dummy_cable, dx=dimensions[0], dy=dimensions[1], dz=dimensions[2]] add my_cables
tag @e[type=item_frame, dx=dimensions[0], dy=dimensions[1], dz=dimensions[2]] add my_servo

execute as @e[tag=my_cables] at @s run setblock ~ ~ ~ minecraft:conduit[waterlogged=false]
execute as @e[tag=my_cables] run data modify entity @s item set value {id: "minecraft:light_gray_stained_glass_pane", count: 1}
execute as @e[tag=my_cables,sort=random] run function #itemio:calls/cables/init


execute as @e[tag=my_servo] if items entity @s contents red_wool run tag @s add itemio.servo
execute as @e[tag=my_servo] if items entity @s contents lime_wool run tag @s add itemio.servo
execute as @e[tag=my_servo] if items entity @s contents red_wool run tag @s add itemio.servo.extract
execute as @e[tag=my_servo] if items entity @s contents lime_wool run tag @s add itemio.servo.insert

execute as @e[tag=my_servo] run scoreboard players set @s itemio.servo.stack_limit 1
execute as @e[tag=my_servo] run scoreboard players set @s itemio.servo.retry_limit 32

execute as @e[tag=my_servo] run function #itemio:calls/servos/init

tag @e[tag=my_cables] remove my_cables
tag @e[tag=my_servo] remove my_servo


await delay 30s

assert block ~2 ~ ~1 minecraft:chest[facing=south,type=single,waterlogged=false]{Items:[{Slot:0b,components:{"minecraft:potion_contents":{potion:"minecraft:regeneration"}},count:1,id:"minecraft:potion"},{Slot:1b,components:{"minecraft:potion_contents":{potion:"minecraft:regeneration"}},count:1,id:"minecraft:potion"},{Slot:2b,components:{"minecraft:potion_contents":{potion:"minecraft:regeneration"}},count:1,id:"minecraft:potion"}],components:{}}
assert not data block ~2 ~ ~1 Items[3]

assert not data block ~ ~2 ~1 Items[0]
assert not data block ~4 ~2 ~1 Items[0]

assert not data block ~2 ~4 ~1 Items[3]
