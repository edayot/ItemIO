# @template itemio_test:empty_5x3x5
# @timeout 400
# Hoppers around a custom container are disabled, and emulated with its ioconfig

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


setblock ~2 ~ ~2 chest
setblock ~2 ~1 ~2 hopper[facing=down]{TransferCooldown:20}
setblock ~2 ~2 ~2 barrel{Items:[{Slot:0b,id:"minecraft:stone",count:3},{Slot:1b,id:"minecraft:dirt",count:1}]}
setblock ~1 ~2 ~2 hopper[facing=east]{TransferCooldown:20,Items:[{Slot:0b,id:"minecraft:dirt",count:2},{Slot:1b,id:"minecraft:stone",count:1}]}

execute positioned ~2.5 ~2.5 ~2.5 summon marker run function ~/place:
    tag @s add itemio.test.hopper_emulation
    tag @s add itemio.container
    tag @s add itemio.container.hopper
    data modify entity @s data.itemio.ioconfig set value [
        {Slot:0b, mode:"output", allowed_side:{bottom:1b}},
        {Slot:1b, mode:"input", allowed_side:{west:1b}, filters:[{id:["minecraft:dirt"]}]},
    ]
    function #itemio:calls/container/init

# the hopper below pulls the stone (output slot), and pushes it into the chest
await result 3 run execute if items block ~2 ~ ~2 container.* minecraft:stone
# the hopper on the side pushes its dirt in the input slot, but not its stone
await result 3 run execute if items block ~2 ~2 ~2 container.1 minecraft:dirt
await delay 2s
assert result 1 run execute if items block ~1 ~2 ~2 container.* minecraft:stone
assert not items block ~2 ~2 ~2 container.0 *
assert not items block ~2 ~1 ~2 container.* *
assert not items block ~2 ~ ~2 container.* minecraft:dirt

kill @e[tag=itemio.test.hopper_emulation]
