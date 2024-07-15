# @template itemio:network_test

say start network test

await delay 2s
await score #loaded itemio.math matches 1
await entity 93682a08-d099-4e8f-a4a6-1e33a3692301

kill @e[tag=dummy_cable]
kill @e[tag=dummy_servo]


# summon cable
fill ~ ~ ~ ~5 ~5 ~5 command_block{Command:"summon minecraft:item_display ~ ~ ~ {Tags:[\"dummy_cable\",\"itemio.cable\"]}",auto:1b} replace conduit

await delay 5t

execute as @e[tag=dummy_cable] at @s run setblock ~ ~ ~ minecraft:conduit[waterlogged=false]
execute as @e[tag=dummy_cable] run data modify entity @s item set value {id: "minecraft:light_gray_stained_glass_pane", count: 1, components: {"minecraft:custom_model_data": 1430000}}
execute as @e[tag=dummy_cable] run data merge entity @s {transformation: {scale: [1.001f, 1.001f, 1.001f]}}
execute as @e[tag=dummy_cable,sort=random] run function #itemio:calls/cables/init

# test network id is the same for all cables
scoreboard players operation #network_id itemio.network_id.low = @n[tag=dummy_cable] itemio.network_id.low
execute as @e[tag=dummy_cable] run assert score @s itemio.network_id.low = #network_id itemio.network_id.low


# summon servos
# red_wool = extract
# lime_wool = insert

await delay 5t


execute as @e[type=item_frame] if items entity @s contents red_wool run tag @s add itemio.servo
execute as @e[type=item_frame] if items entity @s contents lime_wool run tag @s add itemio.servo
execute as @e[type=item_frame] if items entity @s contents red_wool run tag @s add itemio.servo.extract
execute as @e[type=item_frame] if items entity @s contents lime_wool run tag @s add itemio.servo.insert

execute as @e[tag=itemio.servo] run scoreboard players set @s itemio.servo.stack_limit 1
execute as @e[tag=itemio.servo] run scoreboard players set @s itemio.servo.retry_limit 32
execute as @e[tag=itemio.servo] run tag @s add dummy_servo

execute as @e[tag=itemio.servo] run function #itemio:calls/servos/init


await delay 1s

assert block ~4 ~1 ~2 minecraft:barrel[facing=north,open=false]{Items:[{Slot:24b,count:1,id:"minecraft:minecart"},{Slot:25b,count:1,id:"minecraft:minecart"},{Slot:26b,count:1,id:"minecraft:minecart"}]}

assert block ~3 ~1 ~0 minecraft:barrel[facing=up,open=false]{Items:[{Slot:0b,count:1,id:"minecraft:birch_stairs"},{Slot:1b,count:1,id:"minecraft:birch_stairs"},{Slot:2b,count:1,id:"minecraft:birch_stairs"},{Slot:3b,count:1,id:"minecraft:birch_stairs"},{Slot:4b,count:1,id:"minecraft:birch_stairs"},{Slot:5b,count:1,id:"minecraft:birch_stairs"},{Slot:6b,count:1,id:"minecraft:birch_stairs"},{Slot:7b,count:1,id:"minecraft:birch_stairs"},{Slot:8b,count:1,id:"minecraft:birch_stairs"},{Slot:9b,count:1,id:"minecraft:birch_stairs"},{Slot:10b,count:1,id:"minecraft:birch_stairs"},{Slot:11b,count:1,id:"minecraft:birch_stairs"},{Slot:12b,count:1,id:"minecraft:birch_stairs"},{Slot:13b,count:1,id:"minecraft:birch_stairs"},{Slot:14b,count:1,id:"minecraft:birch_stairs"},{Slot:15b,count:1,id:"minecraft:birch_stairs"},{Slot:16b,count:1,id:"minecraft:birch_stairs"},{Slot:17b,count:1,id:"minecraft:birch_stairs"},{Slot:18b,count:1,id:"minecraft:minecart"},{Slot:19b,count:1,id:"minecraft:minecart"},{Slot:20b,count:1,id:"minecraft:minecart"},{Slot:21b,count:1,id:"minecraft:minecart"},{Slot:22b,count:1,id:"minecraft:minecart"},{Slot:23b,count:1,id:"minecraft:minecart"},{Slot:24b,count:1,id:"minecraft:minecart"},{Slot:25b,count:1,id:"minecraft:minecart"},{Slot:26b,count:1,id:"minecraft:minecart"}]}

assert block ~1 ~1 ~2 minecraft:barrel[facing=up,open=false]{Items:[{Slot:0b,count:1,id:"minecraft:birch_stairs"},{Slot:1b,count:1,id:"minecraft:birch_stairs"},{Slot:2b,count:1,id:"minecraft:birch_stairs"},{Slot:3b,count:1,id:"minecraft:birch_stairs"},{Slot:4b,count:1,id:"minecraft:birch_stairs"},{Slot:5b,count:1,id:"minecraft:birch_stairs"},{Slot:6b,count:1,id:"minecraft:birch_stairs"},{Slot:7b,count:1,id:"minecraft:birch_stairs"},{Slot:8b,count:1,id:"minecraft:birch_stairs"},{Slot:9b,count:1,id:"minecraft:minecart"},{Slot:10b,count:1,id:"minecraft:minecart"},{Slot:11b,count:1,id:"minecraft:minecart"},{Slot:12b,count:1,id:"minecraft:minecart"},{Slot:13b,count:1,id:"minecraft:minecart"},{Slot:14b,count:1,id:"minecraft:minecart"},{Slot:15b,count:1,id:"minecraft:minecart"},{Slot:16b,count:1,id:"minecraft:minecart"},{Slot:17b,count:1,id:"minecraft:minecart"},{Slot:18b,count:1,id:"minecraft:birch_stairs"},{Slot:19b,count:1,id:"minecraft:birch_stairs"},{Slot:20b,count:1,id:"minecraft:birch_stairs"},{Slot:21b,count:1,id:"minecraft:birch_stairs"},{Slot:22b,count:1,id:"minecraft:birch_stairs"},{Slot:23b,count:1,id:"minecraft:birch_stairs"},{Slot:24b,count:1,id:"minecraft:birch_stairs"},{Slot:25b,count:1,id:"minecraft:birch_stairs"},{Slot:26b,count:1,id:"minecraft:birch_stairs"}]}

assert block ~5 ~5 ~1 minecraft:barrel[facing=up,open=false]{Items:[{Slot:0b,count:1,id:"minecraft:birch_stairs"},{Slot:1b,count:1,id:"minecraft:birch_stairs"},{Slot:2b,count:1,id:"minecraft:birch_stairs"},{Slot:3b,count:1,id:"minecraft:birch_stairs"},{Slot:4b,count:1,id:"minecraft:birch_stairs"},{Slot:5b,count:1,id:"minecraft:birch_stairs"},{Slot:6b,count:1,id:"minecraft:birch_stairs"},{Slot:7b,count:1,id:"minecraft:minecart"},{Slot:8b,count:1,id:"minecraft:minecart"},{Slot:9b,count:1,id:"minecraft:birch_stairs"},{Slot:10b,count:1,id:"minecraft:birch_stairs"},{Slot:11b,count:1,id:"minecraft:birch_stairs"},{Slot:12b,count:1,id:"minecraft:birch_stairs"},{Slot:13b,count:1,id:"minecraft:birch_stairs"},{Slot:14b,count:1,id:"minecraft:birch_stairs"},{Slot:15b,count:1,id:"minecraft:birch_stairs"},{Slot:16b,count:1,id:"minecraft:minecart"},{Slot:17b,count:1,id:"minecraft:minecart"},{Slot:18b,count:1,id:"minecraft:birch_stairs"},{Slot:19b,count:1,id:"minecraft:birch_stairs"},{Slot:20b,count:1,id:"minecraft:birch_stairs"},{Slot:21b,count:1,id:"minecraft:birch_stairs"},{Slot:22b,count:1,id:"minecraft:birch_stairs"},{Slot:23b,count:1,id:"minecraft:birch_stairs"},{Slot:24b,count:1,id:"minecraft:birch_stairs"},{Slot:25b,count:1,id:"minecraft:minecart"},{Slot:26b,count:1,id:"minecraft:minecart"}]}

# fail "Normal failure"