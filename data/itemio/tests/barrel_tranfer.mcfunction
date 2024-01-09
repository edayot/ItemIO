# @template itemio:barrel_transfer


datapack disable vanilla
datapack enable vanilla first

# origin, destination, count
# ~3 ~3 ~1, ~3 ~1 ~1, 1

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

assert block ~3 ~3 ~3 barrel{Items:[{Slot: 0b, id: "minecraft:barrel", Count: 1b}, {Slot: 14b, id: "minecraft:diamond", Count: 1b}, {Slot: 22b, id: "minecraft:diamond", Count: 1b}]}
assert block ~3 ~1 ~3 barrel{Items:[{Slot: 0b, id: "minecraft:diamond", Count: 64b}, {Slot: 1b, id: "minecraft:diamond", Count: 64b}, {Slot: 2b, id: "minecraft:diamond", Count: 64b}, {Slot: 3b, id: "minecraft:diamond", Count: 64b}, {Slot: 4b, id: "minecraft:diamond", Count: 64b}, {Slot: 5b, id: "minecraft:diamond", Count: 64b}, {Slot: 6b, id: "minecraft:diamond", Count: 64b}, {Slot: 7b, id: "minecraft:diamond", Count: 64b}, {Slot: 8b, id: "minecraft:diamond", Count: 64b}, {Slot: 9b, id: "minecraft:diamond", Count: 64b}, {Slot: 10b, id: "minecraft:diamond", Count: 64b}, {Slot: 11b, id: "minecraft:diamond", Count: 64b}, {Slot: 12b, id: "minecraft:diamond", Count: 64b}, {Slot: 13b, id: "minecraft:diamond", Count: 64b}, {Slot: 14b, id: "minecraft:diamond", Count: 64b}, {Slot: 15b, id: "minecraft:diamond", Count: 64b}, {Slot: 16b, id: "minecraft:diamond", Count: 64b}, {Slot: 17b, id: "minecraft:diamond", Count: 64b}, {Slot: 18b, id: "minecraft:diamond", Count: 64b}, {Slot: 19b, id: "minecraft:diamond", Count: 64b}, {Slot: 20b, id: "minecraft:diamond", Count: 64b}, {Slot: 21b, id: "minecraft:diamond", Count: 64b}, {Slot: 22b, id: "minecraft:diamond", Count: 64b}, {Slot: 23b, id: "minecraft:diamond", Count: 64b}, {Slot: 24b, id: "minecraft:diamond", Count: 64b}, {Slot: 25b, id: "minecraft:diamond", Count: 64b}, {Slot: 26b, id: "minecraft:diamond", Count: 64b}]}

assert not data block ~3 ~3 ~3 Items[3]

kill @e[tag=dummy]


# origin, destination, count
# ~3 ~3 ~3, ~3 ~1 ~3, 1

scoreboard players set #max_output_count itemio.io 1
data modify storage itemio:io output_side set value "wireless"
data remove storage itemio:io input 
data remove storage itemio:io filters 

summon marker ~3 ~1 ~3 {Tags:["itemio.transfer.destination","dummy"],data:{itemio:{input_side:"wireless"}}}
execute positioned ~3 ~3 ~3 run function #itemio:calls/transfer

assert score #success_transfer itemio.io matches 0

assert block ~3 ~3 ~3 barrel{Items:[{Slot: 0b, id: "minecraft:barrel", Count: 1b}, {Slot: 14b, id: "minecraft:diamond", Count: 1b}, {Slot: 22b, id: "minecraft:diamond", Count: 1b}]}
assert block ~3 ~1 ~3 barrel{Items:[{Slot: 0b, id: "minecraft:diamond", Count: 64b}, {Slot: 1b, id: "minecraft:diamond", Count: 64b}, {Slot: 2b, id: "minecraft:diamond", Count: 64b}, {Slot: 3b, id: "minecraft:diamond", Count: 64b}, {Slot: 4b, id: "minecraft:diamond", Count: 64b}, {Slot: 5b, id: "minecraft:diamond", Count: 64b}, {Slot: 6b, id: "minecraft:diamond", Count: 64b}, {Slot: 7b, id: "minecraft:diamond", Count: 64b}, {Slot: 8b, id: "minecraft:diamond", Count: 64b}, {Slot: 9b, id: "minecraft:diamond", Count: 64b}, {Slot: 10b, id: "minecraft:diamond", Count: 64b}, {Slot: 11b, id: "minecraft:diamond", Count: 64b}, {Slot: 12b, id: "minecraft:diamond", Count: 64b}, {Slot: 13b, id: "minecraft:diamond", Count: 64b}, {Slot: 14b, id: "minecraft:diamond", Count: 64b}, {Slot: 15b, id: "minecraft:diamond", Count: 64b}, {Slot: 16b, id: "minecraft:diamond", Count: 64b}, {Slot: 17b, id: "minecraft:diamond", Count: 64b}, {Slot: 18b, id: "minecraft:diamond", Count: 64b}, {Slot: 19b, id: "minecraft:diamond", Count: 64b}, {Slot: 20b, id: "minecraft:diamond", Count: 64b}, {Slot: 21b, id: "minecraft:diamond", Count: 64b}, {Slot: 22b, id: "minecraft:diamond", Count: 64b}, {Slot: 23b, id: "minecraft:diamond", Count: 64b}, {Slot: 24b, id: "minecraft:diamond", Count: 64b}, {Slot: 25b, id: "minecraft:diamond", Count: 64b}, {Slot: 26b, id: "minecraft:diamond", Count: 64b}]}

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

assert block ~3 ~3 ~5 barrel{Items:[{Slot: 1b, id: "minecraft:egg", Count: 16b}]}
assert block ~3 ~1 ~5 barrel{Items:[{Slot: 0b, id: "minecraft:egg", Count: 16b}, {Slot: 1b, id: "minecraft:egg", Count: 16b}, {Slot: 2b, id: "minecraft:egg", Count: 9b}, {Slot: 3b, id: "minecraft:egg", Count: 1b}, {Slot: 4b, id: "minecraft:egg", Count: 4b}, {Slot: 5b, id: "minecraft:egg", Count: 1b}, {Slot: 6b, id: "minecraft:egg", Count: 3b}, {Slot: 11b, id: "minecraft:egg", Count: 16b}, {Slot: 19b, id: "minecraft:egg", Count: 16b}, {Slot: 20b, id: "minecraft:egg", Count: 16b}]}

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

assert block ~3 ~3 ~5 barrel{Items:[{Slot: 1b, id: "minecraft:egg", Count: 8b}]}
assert block ~3 ~1 ~5 barrel{Items:[{Slot: 0b, id: "minecraft:egg", Count: 16b}, {Slot: 1b, id: "minecraft:egg", Count: 16b}, {Slot: 2b, id: "minecraft:egg", Count: 16b}, {Slot: 3b, id: "minecraft:egg", Count: 2b}, {Slot: 4b, id: "minecraft:egg", Count: 4b}, {Slot: 5b, id: "minecraft:egg", Count: 1b}, {Slot: 6b, id: "minecraft:egg", Count: 3b}, {Slot: 11b, id: "minecraft:egg", Count: 16b}, {Slot: 19b, id: "minecraft:egg", Count: 16b}, {Slot: 20b, id: "minecraft:egg", Count: 16b}]}


kill @e[tag=dummy]


# destination
# ~3 ~1 ~7

data modify storage itemio:io input_side set value "wireless"
data modify storage itemio:io input set value {Slot:0b,id:"minecraft:sugar",Count:512}


execute positioned ~3 ~1 ~7 run function #itemio:calls/input

assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 512

assert block ~3 ~1 ~7 barrel{Items:[{Slot: 0b, id: "minecraft:redstone_block", Count: 1b}, {Slot: 1b, id: "minecraft:redstone_block", Count: 1b}, {Slot: 2b, id: "minecraft:redstone_block", Count: 1b}, {Slot: 3b, id: "minecraft:redstone_block", Count: 1b}, {Slot: 4b, id: "minecraft:sugar", Count: 64b}, {Slot: 5b, id: "minecraft:sugar", Count: 64b}, {Slot: 6b, id: "minecraft:sugar", Count: 64b}, {Slot: 7b, id: "minecraft:sugar", Count: 64b}, {Slot: 8b, id: "minecraft:sugar", Count: 64b}, {Slot: 9b, id: "minecraft:sugar", Count: 64b}, {Slot: 10b, id: "minecraft:sugar", Count: 64b}, {Slot: 11b, id: "minecraft:sugar", Count: 64b}]}




# destination
# ~3 ~1 ~7

data modify storage itemio:io input_side set value "wireless"
data modify storage itemio:io input set value {Slot:0b,id:"minecraft:redstone_block",Count:143}


execute positioned ~3 ~1 ~7 run function #itemio:calls/input

assert score #success_input itemio.io matches 1
assert score #count_to_remove itemio.io matches 143


assert block ~3 ~1 ~7 barrel{Items:[{Slot: 0b, id: "minecraft:redstone_block", Count: 64b}, {Slot: 1b, id: "minecraft:redstone_block", Count: 64b}, {Slot: 2b, id: "minecraft:redstone_block", Count: 3b}, {Slot: 3b, id: "minecraft:redstone_block", Count: 1b}, {Slot: 4b, id: "minecraft:sugar", Count: 64b}, {Slot: 5b, id: "minecraft:sugar", Count: 64b}, {Slot: 6b, id: "minecraft:sugar", Count: 64b}, {Slot: 7b, id: "minecraft:sugar", Count: 64b}, {Slot: 8b, id: "minecraft:sugar", Count: 64b}, {Slot: 9b, id: "minecraft:sugar", Count: 64b}, {Slot: 10b, id: "minecraft:sugar", Count: 64b}, {Slot: 11b, id: "minecraft:sugar", Count: 64b}]}

