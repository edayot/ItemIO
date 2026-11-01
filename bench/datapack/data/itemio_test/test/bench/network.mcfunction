# @template itemio_test:chest_network
# @timeout 600
# One network process (1 extract servo, 1 insert servo, retry_limit 8) between two double chests

from itemio_test:bench import bench, full_container, impl

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004
await delay 13t

for x, y in [(1, 0), (2, 0), (3, 0), (1, 1), (3, 1)]:
    raw f'summon item_display ~{x}.5 ~{y}.5 ~.5 {{Tags:["bench_cable","itemio.cable"],item:{{id:"minecraft:light_gray_stained_glass_pane",count:1}}}}'
execute as @e[tag=bench_cable] run function #itemio:calls/cables/init

tag @e[type=item_frame,dx=5,dy=3,dz=1] add bench_servo
execute as @e[tag=bench_servo] run tag @s add itemio.servo
execute as @e[tag=bench_servo] if items entity @s contents red_wool run tag @s add itemio.servo.extract
execute as @e[tag=bench_servo] if items entity @s contents lime_wool run tag @s add itemio.servo.insert
scoreboard players set @e[tag=bench_servo] itemio.servo.stack_limit 1
scoreboard players set @e[tag=bench_servo] itemio.servo.retry_limit 8
execute as @e[tag=bench_servo] run function #itemio:calls/servos/init
scoreboard players operation #bench_queue itemio.math = @e[tag=bench_servo,tag=itemio.servo.extract,limit=1] itemio.network.process_queue

# the extract servo (red wool) is under ~1 ~2 ~, the insert one (lime wool) under ~3 ~2 ~
def reset():
    raw f"data modify block ~ ~2 ~ Items set value {full_container('oak_planks')}"
    raw f"data modify block ~1 ~2 ~ Items set value {full_container('oak_planks')}"
    data modify block ~3 ~2 ~ Items set value []
    data modify block ~4 ~2 ~ Items set value []
    scoreboard players set @e[tag=bench_servo] itemio.servo.cooldown 0

# each process is a new tick (a network is processed once per tick)
def body():
    scoreboard players add #global_tick itemio.math 1
    scoreboard players operation #current_queue itemio.math = #bench_queue itemio.math
    raw f"function {impl('tick_if_loaded')}"

bench("network_process", 100, body, reset)

assert result 800 run execute if items block ~3 ~2 ~ container.* minecraft:oak_planks
tag @e[tag=bench_servo] remove itemio.servo.initialised
kill @e[tag=bench_cable]
