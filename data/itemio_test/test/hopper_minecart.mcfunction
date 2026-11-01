# @template itemio_test:empty_5x3x5
# @timeout 200
# Hopper minecarts under a container are disabled, and enabled again when the container is gone

await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


setblock ~2 ~1 ~2 barrel
setblock ~2 ~ ~2 rail
execute positioned ~2.5 ~1.5 ~2.5 summon marker run function ~/place:
    tag @s add itemio.test.minecart_container
    tag @s add itemio.container
    function #itemio:calls/container/init
summon hopper_minecart ~2.5 ~ ~2.5 {Tags:["itemio.test.minecart"]}

await entity @n[tag=itemio.test.minecart,tag=itemio.minecart_disabled,nbt={Enabled:0b}]

kill @e[tag=itemio.test.minecart_container]
await entity @n[tag=itemio.test.minecart,tag=!itemio.minecart_disabled,nbt={Enabled:1b}]
kill @e[tag=itemio.test.minecart]
