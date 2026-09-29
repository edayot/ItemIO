# @template itemio:custom_container
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


execute positioned ~1.5 ~2.5 ~0.5 summon marker run function ~/on_summon_output:
    tag @s add itemio.container
    tag @s add itemio.container.hopper
    data modify entity @s data.itemio.ioconfig set value [
        {
            Slot: 12b,
            mode: "output",
            allowed_side:{
                north: 1b, south: 1b, east: 1b,
                west: 1b, top: 1b, bottom: 1b
            },
            filters: [
                {
                    id: ["minecraft:oak_planks"]
                }
            ]
        },
        {
            Slot: 14b,
            mode: "output",
            allowed_side:{
                north: 1b, south: 1b, east: 1b,
                west: 1b, top: 1b, bottom: 1b
            },
            filters: [
                {
                    id: ["minecraft:oak_planks"]
                }
            ]
        },
    ]
    function #itemio:calls/container/init

execute positioned ~3.5 ~2.5 ~0.5 summon marker run function ~/on_summon_input:
    tag @s add itemio.container
    tag @s add itemio.container.hopper
    data modify entity @s data.itemio.ioconfig set value [
        {
            Slot: 12b,
            mode: "input",
            allowed_side:{
                north: 1b, south: 1b, east: 1b,
                west: 1b, top: 1b, bottom: 1b
            },
            filters: [
                {
                    id: ["minecraft:oak_planks"]
                }
            ]
        },
        {
            Slot: 14b,
            mode: "input",
            allowed_side:{
                north: 1b, south: 1b, east: 1b,
                west: 1b, top: 1b, bottom: 1b
            },
            filters: [
                {
                    id: ["minecraft:oak_planks"]
                }
            ]
        },
    ]
    function #itemio:calls/container/init



await delay 5s

assert not data block ~1 ~2 ~ Items[0]

assert block ~3 ~2 ~ minecraft:barrel[facing=south,open=false]{Items:[{Slot:12b,count:6,id:"minecraft:oak_planks"}],components:{}}
assert not data block ~3 ~2 ~ Items[1]
