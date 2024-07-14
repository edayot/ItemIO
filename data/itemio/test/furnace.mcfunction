
say start furnace test

await delay 2s
await score #loaded itemio.math matches 1
await entity 93682a08-d099-4e8f-a4a6-1e33a3692301



setblock ~ ~2 ~ furnace
data modify storage itemio:io input_side set value "north"
data modify storage itemio:io input set value {id:"minecraft:coal",count:1}

execute positioned ~ ~2 ~ run function #itemio:calls/input

assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 1

assert block ~ ~2 ~ furnace{Items:[{Slot:1b,id:"minecraft:coal",count:1}]}
assert not data block ~ ~2 ~ Items[1]




data modify storage itemio:io input_side set value "south"
data modify storage itemio:io input set value {id:"minecraft:coal",count:100}

execute positioned ~ ~2 ~ run function #itemio:calls/input

assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 63

assert block ~ ~2 ~ furnace{Items:[{Slot:1b,id:"minecraft:coal",count:64}]}
assert not data block ~ ~2 ~ Items[1]

