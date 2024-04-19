# @template itemio:barrel_transfer

# origin, destination, count
# ~3 ~3 ~1, ~3 ~1 ~1, 1

datapack disable "file/datapack"
datapack enable "file/datapack" after "vanilla"
await delay 1s
kill @e[tag=dummy]



await score #loaded itemio.math matches 1
await entity 93682a08-d099-4e8f-a4a6-1e33a3692301


assert block -30000000 22 1610 yellow_shulker_box
assert block -30000000 23 1610 barrel


forceload add ~-16 ~-16 ~16 ~16
await delay 1s

execute unless loaded ~-16 ~ ~-16 run await delay 1t
execute unless loaded ~16 ~ ~16 run await delay 1t

scoreboard players set #max_output_count itemio.io 1
data modify storage itemio:io output_side set value "wireless"
data remove storage itemio:io input 
data remove storage itemio:io filters 

summon marker ~3 ~1 ~1 {Tags:["itemio.transfer.destination","dummy"],data:{itemio:{input_side:"wireless"}}}
execute positioned ~3 ~3 ~1 run function #itemio:calls/transfer

assert score #success_transfer itemio.io matches 1

await delay 1t
assert block ~3 ~3 ~1 barrel{Items:[]}



assert not data block ~3 ~3 ~1 Items[0]
assert not data block ~3 ~1 ~1 Items[1]
kill @e[tag=dummy]


# origin, destination, count
# ~3 ~3 ~3, ~3 ~1 ~3, 1

scoreboard players set #max_output_count itemio.io 1
data modify storage itemio:io output_side set value "wireless"
data remove storage itemio:io input 
data remove storage itemio:io filters 

summon marker ~3 ~1 ~3 {Tags:["itemio.transfer.destination","dummy"],data:{itemio:{input_side:"wireless"}}}
execute positioned ~3 ~3 ~3 run function #itemio:calls/transfer

assert score #success_transfer itemio.io matches 1

assert block ~3 ~3 ~3 barrel{Items:[{Slot: 0b, id: "minecraft:barrel", count: 1}, {Slot: 14b, id: "minecraft:diamond", count: 1}, {Slot: 22b, id: "minecraft:diamond", count: 1}]}
assert block ~3 ~1 ~3 barrel{Items:[{Slot: 0b, id: "minecraft:diamond", count: 64}, {Slot: 1b, id: "minecraft:diamond", count: 64}, {Slot: 2b, id: "minecraft:diamond", count: 64}, {Slot: 3b, id: "minecraft:diamond", count: 64}, {Slot: 4b, id: "minecraft:diamond", count: 64}, {Slot: 5b, id: "minecraft:diamond", count: 64}, {Slot: 6b, id: "minecraft:diamond", count: 64}, {Slot: 7b, id: "minecraft:diamond", count: 64}, {Slot: 8b, id: "minecraft:diamond", count: 64}, {Slot: 9b, id: "minecraft:diamond", count: 64}, {Slot: 10b, id: "minecraft:diamond", count: 64}, {Slot: 11b, id: "minecraft:diamond", count: 64}, {Slot: 12b, id: "minecraft:diamond", count: 64}, {Slot: 13b, id: "minecraft:diamond", count: 64}, {Slot: 14b, id: "minecraft:diamond", count: 64}, {Slot: 15b, id: "minecraft:diamond", count: 64}, {Slot: 16b, id: "minecraft:diamond", count: 64}, {Slot: 17b, id: "minecraft:diamond", count: 64}, {Slot: 18b, id: "minecraft:diamond", count: 64}, {Slot: 19b, id: "minecraft:diamond", count: 64}, {Slot: 20b, id: "minecraft:diamond", count: 64}, {Slot: 21b, id: "minecraft:diamond", count: 64}, {Slot: 22b, id: "minecraft:diamond", count: 64}, {Slot: 23b, id: "minecraft:diamond", count: 64}, {Slot: 24b, id: "minecraft:diamond", count: 64}, {Slot: 25b, id: "minecraft:diamond", count: 64}, {Slot: 26b, id: "minecraft:diamond", count: 64}]}

assert not data block ~3 ~3 ~3 Items[3]

kill @e[tag=dummy]


# origin, destination, count
# ~3 ~3 ~3, ~3 ~1 ~3, 1

scoreboard players set #max_output_count itemio.io 1
data modify storage itemio:io output_side set value "wireless"
data remove storage itemio:io input 
data remove storage itemio:io filters 

summon marker ~3 ~1 ~3 {Tags:["itemio.transfer.destination","dummy"],data:{itemio:{input_side:"wireless"}}}

say Transfer start

execute positioned ~3 ~3 ~3 run function #itemio:calls/transfer

say Transfer end

assert score #success_transfer itemio.io matches 0

assert block ~3 ~3 ~3 barrel{Items:[{Slot: 0b, id: "minecraft:barrel", count: 1}, {Slot: 14b, id: "minecraft:diamond", count: 1}, {Slot: 22b, id: "minecraft:diamond", count: 1}]}
assert block ~3 ~1 ~3 barrel{Items:[{Slot: 0b, id: "minecraft:diamond", count: 64}, {Slot: 1b, id: "minecraft:diamond", count: 64}, {Slot: 2b, id: "minecraft:diamond", count: 64}, {Slot: 3b, id: "minecraft:diamond", count: 64}, {Slot: 4b, id: "minecraft:diamond", count: 64}, {Slot: 5b, id: "minecraft:diamond", count: 64}, {Slot: 6b, id: "minecraft:diamond", count: 64}, {Slot: 7b, id: "minecraft:diamond", count: 64}, {Slot: 8b, id: "minecraft:diamond", count: 64}, {Slot: 9b, id: "minecraft:diamond", count: 64}, {Slot: 10b, id: "minecraft:diamond", count: 64}, {Slot: 11b, id: "minecraft:diamond", count: 64}, {Slot: 12b, id: "minecraft:diamond", count: 64}, {Slot: 13b, id: "minecraft:diamond", count: 64}, {Slot: 14b, id: "minecraft:diamond", count: 64}, {Slot: 15b, id: "minecraft:diamond", count: 64}, {Slot: 16b, id: "minecraft:diamond", count: 64}, {Slot: 17b, id: "minecraft:diamond", count: 64}, {Slot: 18b, id: "minecraft:diamond", count: 64}, {Slot: 19b, id: "minecraft:diamond", count: 64}, {Slot: 20b, id: "minecraft:diamond", count: 64}, {Slot: 21b, id: "minecraft:diamond", count: 64}, {Slot: 22b, id: "minecraft:diamond", count: 64}, {Slot: 23b, id: "minecraft:diamond", count: 64}, {Slot: 24b, id: "minecraft:diamond", count: 64}, {Slot: 25b, id: "minecraft:diamond", count: 64}, {Slot: 26b, id: "minecraft:diamond", count: 64}]}

assert not data block ~3 ~3 ~3 Items[3]

kill @e[tag=dummy]


# origin, destination, count
# ~3 ~3 ~5, ~3 ~1 ~5, 64

scoreboard players set #max_output_count itemio.io 64
data modify storage itemio:io output_side set value "wireless"
data remove storage itemio:io input
data remove storage itemio:io filters

summon marker ~3 ~1 ~5 {Tags:["itemio.transfer.destination","dummy"],data:{itemio:{input_side:"wireless"}}}
execute positioned ~3 ~3 ~5 run function #itemio:calls/transfer

assert score #success_transfer itemio.io matches 1

assert block ~3 ~3 ~5 barrel{Items:[{Slot: 1b, id: "minecraft:egg", count: 16}]}
assert block ~3 ~1 ~5 barrel{Items:[{Slot: 0b, id: "minecraft:egg", count: 16}, {Slot: 1b, id: "minecraft:egg", count: 16}, {Slot: 2b, id: "minecraft:egg", count: 9}, {Slot: 3b, id: "minecraft:egg", count: 1}, {Slot: 4b, id: "minecraft:egg", count: 4}, {Slot: 5b, id: "minecraft:egg", count: 1}, {Slot: 6b, id: "minecraft:egg", count: 3}, {Slot: 11b, id: "minecraft:egg", count: 16}, {Slot: 19b, id: "minecraft:egg", count: 16}, {Slot: 20b, id: "minecraft:egg", count: 16}]}

kill @e[tag=dummy]


# origin, destination, count
# ~3 ~3 ~5, ~3 ~1 ~5, 8

scoreboard players set #max_output_count itemio.io 8
data modify storage itemio:io output_side set value "wireless"
data remove storage itemio:io input
data remove storage itemio:io filters

summon marker ~3 ~1 ~5 {Tags:["itemio.transfer.destination","dummy"],data:{itemio:{input_side:"wireless"}}}
execute positioned ~3 ~3 ~5 run function #itemio:calls/transfer

assert score #success_transfer itemio.io matches 1

assert block ~3 ~3 ~5 barrel{Items:[{Slot: 1b, id: "minecraft:egg", count: 8}]}
assert block ~3 ~1 ~5 barrel{Items:[{Slot: 0b, id: "minecraft:egg", count: 16}, {Slot: 1b, id: "minecraft:egg", count: 16}, {Slot: 2b, id: "minecraft:egg", count: 16}, {Slot: 3b, id: "minecraft:egg", count: 2}, {Slot: 4b, id: "minecraft:egg", count: 4}, {Slot: 5b, id: "minecraft:egg", count: 1}, {Slot: 6b, id: "minecraft:egg", count: 3}, {Slot: 11b, id: "minecraft:egg", count: 16}, {Slot: 19b, id: "minecraft:egg", count: 16}, {Slot: 20b, id: "minecraft:egg", count: 16}]}


kill @e[tag=dummy]


# destination
# ~3 ~1 ~7

data modify storage itemio:io input_side set value "wireless"
data modify storage itemio:io input set value {Slot:0b,id:"minecraft:sugar",count:512}


execute positioned ~3 ~1 ~7 run function #itemio:calls/input

assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 512

assert block ~3 ~1 ~7 barrel{Items:[{Slot: 0b, id: "minecraft:redstone_block", count: 1}, {Slot: 1b, id: "minecraft:redstone_block", count: 1}, {Slot: 2b, id: "minecraft:redstone_block", count: 1}, {Slot: 3b, id: "minecraft:redstone_block", count: 1}, {Slot: 4b, id: "minecraft:sugar", count: 64}, {Slot: 5b, id: "minecraft:sugar", count: 64}, {Slot: 6b, id: "minecraft:sugar", count: 64}, {Slot: 7b, id: "minecraft:sugar", count: 64}, {Slot: 8b, id: "minecraft:sugar", count: 64}, {Slot: 9b, id: "minecraft:sugar", count: 64}, {Slot: 10b, id: "minecraft:sugar", count: 64}, {Slot: 11b, id: "minecraft:sugar", count: 64}]}




# destination
# ~3 ~1 ~7

data modify storage itemio:io input_side set value "wireless"
data modify storage itemio:io input set value {Slot:0b,id:"minecraft:redstone_block",count:143}


execute positioned ~3 ~1 ~7 run function #itemio:calls/input

assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 143


assert block ~3 ~1 ~7 barrel{Items:[{Slot: 0b, id: "minecraft:redstone_block", count: 64}, {Slot: 1b, id: "minecraft:redstone_block", count: 64}, {Slot: 2b, id: "minecraft:redstone_block", count: 18}, {Slot: 3b, id: "minecraft:redstone_block", count: 1}, {Slot: 4b, id: "minecraft:sugar", count: 64}, {Slot: 5b, id: "minecraft:sugar", count: 64}, {Slot: 6b, id: "minecraft:sugar", count: 64}, {Slot: 7b, id: "minecraft:sugar", count: 64}, {Slot: 8b, id: "minecraft:sugar", count: 64}, {Slot: 9b, id: "minecraft:sugar", count: 64}, {Slot: 10b, id: "minecraft:sugar", count: 64}, {Slot: 11b, id: "minecraft:sugar", count: 64}]}

