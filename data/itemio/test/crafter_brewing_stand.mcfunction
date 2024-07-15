# @template itemio:crafter_brewing_stand

say start crafter + brewing_stand test

await delay 2s
await score #loaded itemio.math matches 1
await entity 93682a08-d099-4e8f-a4a6-1e33a3692301

kill @e[tag=dummy_cable_2]
kill @e[tag=dummy_servo_2]


# summon cable
fill ~ ~ ~ ~5 ~5 ~5 command_block{Command:"summon minecraft:item_display ~ ~ ~ {Tags:[\"dummy_cable_2\",\"itemio.cable\"]}",auto:1b} replace conduit

await delay 5t

execute as @e[tag=dummy_cable_2] at @s run setblock ~ ~ ~ minecraft:conduit[waterlogged=false]
execute as @e[tag=dummy_cable_2] run data modify entity @s item set value {id: "minecraft:light_gray_stained_glass_pane", count: 1, components: {"minecraft:custom_model_data": 1430000}}
execute as @e[tag=dummy_cable_2] run data merge entity @s {transformation: {scale: [1.001f, 1.001f, 1.001f]}}
execute as @e[tag=dummy_cable_2,sort=random] run function #itemio:calls/cables/init

# # test network id is the same for all cables
# scoreboard players operation #network_id itemio.network_id.low = @n[tag=dummy_cable_2] itemio.network_id.low
# execute as @e[tag=dummy_cable_2] run assert score @s itemio.network_id.low = #network_id itemio.network_id.low


# summon servos
# red_wool = extract
# lime_wool = insert

await delay 5t


execute as @e[type=item_frame] if items entity @s contents red_wool run tag @s add itemio.servo
execute as @e[type=item_frame] if items entity @s contents lime_wool run tag @s add itemio.servo
execute as @e[type=item_frame] if items entity @s contents red_wool run tag @s add itemio.servo.extract
execute as @e[type=item_frame] if items entity @s contents lime_wool run tag @s add itemio.servo.insert

execute as @e[tag=itemio.servo] run scoreboard players set @s itemio.servo.stack_limit 64
execute as @e[tag=itemio.servo] run scoreboard players set @s itemio.servo.retry_limit 32
execute as @e[tag=itemio.servo] run tag @s add dummy_servo_2

execute as @e[tag=itemio.servo] run function #itemio:calls/servos/init


await delay 2s

assert block ~3 ~4 ~1 minecraft:crafter[crafting=false,orientation=south_up,triggered=false]{Items:[{Slot:0b,count:2,id:"minecraft:diamond"},{Slot:1b,count:2,id:"minecraft:diamond"},{Slot:4b,count:2,id:"minecraft:diamond"},{Slot:5b,count:2,id:"minecraft:diamond"},{Slot:6b,count:1,id:"minecraft:diamond"},{Slot:7b,count:1,id:"minecraft:diamond"}],crafting_ticks_remaining:0,disabled_slots:[I;2,3,8],triggered:0}

assert block ~3 ~4 ~5 minecraft:barrel[facing=south,open=false]{Items:[]}
assert block ~3 ~1 ~5 minecraft:barrel[facing=up,open=false]{Items:[]}


assert block ~3 ~1 ~1 minecraft:brewing_stand[has_bottle_0=true,has_bottle_1=true,has_bottle_2=true]{BrewTime:0s,Fuel:20b,Items:[{Slot:0b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}},count:1,id:"minecraft:potion"},{Slot:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}},count:1,id:"minecraft:potion"},{Slot:2b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}},count:1,id:"minecraft:potion"},{Slot:4b,count:64,id:"minecraft:blaze_powder"}]}
assert block ~3 ~1 ~2 minecraft:brewing_stand[has_bottle_0=true,has_bottle_1=true,has_bottle_2=true]{BrewTime:0s,Fuel:20b,Items:[{Slot:0b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}},count:1,id:"minecraft:potion"},{Slot:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}},count:1,id:"minecraft:potion"},{Slot:2b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}},count:1,id:"minecraft:potion"},{Slot:4b,count:64,id:"minecraft:blaze_powder"}]}
assert block ~3 ~1 ~3 minecraft:brewing_stand[has_bottle_0=true,has_bottle_1=true,has_bottle_2=true]{BrewTime:0s,Fuel:20b,Items:[{Slot:0b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}},count:1,id:"minecraft:potion"},{Slot:1b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}},count:1,id:"minecraft:potion"},{Slot:2b,components:{"minecraft:potion_contents":{potion:"minecraft:water"}},count:1,id:"minecraft:potion"},{Slot:4b,count:64,id:"minecraft:blaze_powder"}]}

# fail "Normal dff"