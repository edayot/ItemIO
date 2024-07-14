
say start chiseled_bookshelf test

await delay 2s
await score #loaded itemio.math matches 1
await entity 93682a08-d099-4e8f-a4a6-1e33a3692301


setblock ~ ~2 ~ chiseled_bookshelf


data modify storage itemio:io input_side set value "north"
data modify storage itemio:io input set value {id:"minecraft:coal",count:1}

execute positioned ~ ~2 ~ run function #itemio:calls/input

assert score #success_input itemio.io matches 0

assert block ~ ~2 ~ chiseled_bookshelf{Items:[]}
assert not data block ~ ~2 ~ Items[0]



data modify storage itemio:io input_side set value "north"
data modify storage itemio:io input set value {id:"minecraft:book",count:3}

execute positioned ~ ~2 ~ run function #itemio:calls/input

assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 3

assert block ~ ~2 ~ chiseled_bookshelf{Items:[{Slot:0b,id:"minecraft:book",count:1},{Slot:1b,id:"minecraft:book",count:1},{Slot:2b,id:"minecraft:book",count:1}]}
assert not data block ~ ~2 ~ Items[3]


