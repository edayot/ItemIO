# @template itemio:multi_transfer


await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004



def make_transfer():
    scoreboard players set #max_output_count itemio.io 1
    data modify storage itemio:io output_side set value "wireless"
    data remove storage itemio:io input 
    data remove storage itemio:io filters 

    summon marker ~ ~ ~ {Tags:["itemio.transfer.destination","dummy"],data:{itemio:{input_side:"wireless"}}}
    summon marker ~2 ~ ~ {Tags:["itemio.transfer.destination","dummy"],data:{itemio:{input_side:"wireless"}}}
    summon marker ~4 ~ ~ {Tags:["itemio.transfer.destination","dummy"],data:{itemio:{input_side:"wireless"}}}
    execute positioned ~2 ~2 ~ run function #itemio:calls/transfer
    kill @e[tag=dummy]




make_transfer()

assert score #success_transfer itemio.io matches 1

assert not data block ~2 ~2 ~ Items[8]
assert block ~2 ~2 ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:1b,count:1,id:"minecraft:raw_iron"},{Slot:2b,count:1,id:"minecraft:diamond"},{Slot:3b,count:1,id:"minecraft:raw_iron"},{Slot:4b,count:1,id:"minecraft:diamond"},{Slot:5b,count:1,id:"minecraft:diamond"},{Slot:6b,count:1,id:"minecraft:raw_iron"},{Slot:7b,count:1,id:"minecraft:leather"},{Slot:8b,count:1,id:"minecraft:leather"}],components:{}}

assert not data block ~ ~ ~ Items[9]
assert block ~ ~ ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:0b,count:2,id:"minecraft:leather"},{Slot:1b,count:1,id:"minecraft:leather"},{Slot:2b,count:1,id:"minecraft:leather"},{Slot:3b,count:1,id:"minecraft:leather"},{Slot:4b,count:1,id:"minecraft:leather"},{Slot:5b,count:1,id:"minecraft:leather"},{Slot:6b,count:1,id:"minecraft:leather"},{Slot:7b,count:1,id:"minecraft:leather"},{Slot:8b,count:1,id:"minecraft:leather"}],components:{}}

assert not data block ~2 ~ ~ Items[9]
assert block ~2 ~ ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:0b,count:1,id:"minecraft:raw_iron"},{Slot:1b,count:1,id:"minecraft:raw_iron"},{Slot:2b,count:1,id:"minecraft:raw_iron"},{Slot:3b,count:1,id:"minecraft:raw_iron"},{Slot:4b,count:1,id:"minecraft:raw_iron"},{Slot:5b,count:1,id:"minecraft:raw_iron"},{Slot:6b,count:1,id:"minecraft:raw_iron"},{Slot:7b,count:1,id:"minecraft:raw_iron"},{Slot:8b,count:1,id:"minecraft:raw_iron"}],components:{}}

assert not data block ~4 ~ ~ Items[9]
assert block ~4 ~ ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:0b,count:1,id:"minecraft:diamond"},{Slot:1b,count:1,id:"minecraft:diamond"},{Slot:2b,count:1,id:"minecraft:diamond"},{Slot:3b,count:1,id:"minecraft:diamond"},{Slot:4b,count:1,id:"minecraft:diamond"},{Slot:5b,count:1,id:"minecraft:diamond"},{Slot:6b,count:1,id:"minecraft:diamond"},{Slot:7b,count:1,id:"minecraft:diamond"},{Slot:8b,count:1,id:"minecraft:diamond"}],components:{}}





make_transfer()

assert score #success_transfer itemio.io matches 1

assert not data block ~2 ~2 ~ Items[7]
assert block ~2 ~2 ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:2b,count:1,id:"minecraft:diamond"},{Slot:3b,count:1,id:"minecraft:raw_iron"},{Slot:4b,count:1,id:"minecraft:diamond"},{Slot:5b,count:1,id:"minecraft:diamond"},{Slot:6b,count:1,id:"minecraft:raw_iron"},{Slot:7b,count:1,id:"minecraft:leather"},{Slot:8b,count:1,id:"minecraft:leather"}],components:{}}

assert not data block ~ ~ ~ Items[9]
assert block ~ ~ ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:0b,count:2,id:"minecraft:leather"},{Slot:1b,count:1,id:"minecraft:leather"},{Slot:2b,count:1,id:"minecraft:leather"},{Slot:3b,count:1,id:"minecraft:leather"},{Slot:4b,count:1,id:"minecraft:leather"},{Slot:5b,count:1,id:"minecraft:leather"},{Slot:6b,count:1,id:"minecraft:leather"},{Slot:7b,count:1,id:"minecraft:leather"},{Slot:8b,count:1,id:"minecraft:leather"}],components:{}}

assert not data block ~2 ~ ~ Items[9]
assert block ~2 ~ ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:0b,count:2,id:"minecraft:raw_iron"},{Slot:1b,count:1,id:"minecraft:raw_iron"},{Slot:2b,count:1,id:"minecraft:raw_iron"},{Slot:3b,count:1,id:"minecraft:raw_iron"},{Slot:4b,count:1,id:"minecraft:raw_iron"},{Slot:5b,count:1,id:"minecraft:raw_iron"},{Slot:6b,count:1,id:"minecraft:raw_iron"},{Slot:7b,count:1,id:"minecraft:raw_iron"},{Slot:8b,count:1,id:"minecraft:raw_iron"}],components:{}}

assert not data block ~4 ~ ~ Items[9]
assert block ~4 ~ ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:0b,count:1,id:"minecraft:diamond"},{Slot:1b,count:1,id:"minecraft:diamond"},{Slot:2b,count:1,id:"minecraft:diamond"},{Slot:3b,count:1,id:"minecraft:diamond"},{Slot:4b,count:1,id:"minecraft:diamond"},{Slot:5b,count:1,id:"minecraft:diamond"},{Slot:6b,count:1,id:"minecraft:diamond"},{Slot:7b,count:1,id:"minecraft:diamond"},{Slot:8b,count:1,id:"minecraft:diamond"}],components:{}}



make_transfer()

assert score #success_transfer itemio.io matches 1

assert not data block ~2 ~2 ~ Items[6]
assert block ~2 ~2 ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:3b,count:1,id:"minecraft:raw_iron"},{Slot:4b,count:1,id:"minecraft:diamond"},{Slot:5b,count:1,id:"minecraft:diamond"},{Slot:6b,count:1,id:"minecraft:raw_iron"},{Slot:7b,count:1,id:"minecraft:leather"},{Slot:8b,count:1,id:"minecraft:leather"}],components:{}}

assert not data block ~ ~ ~ Items[9]
assert block ~ ~ ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:0b,count:2,id:"minecraft:leather"},{Slot:1b,count:1,id:"minecraft:leather"},{Slot:2b,count:1,id:"minecraft:leather"},{Slot:3b,count:1,id:"minecraft:leather"},{Slot:4b,count:1,id:"minecraft:leather"},{Slot:5b,count:1,id:"minecraft:leather"},{Slot:6b,count:1,id:"minecraft:leather"},{Slot:7b,count:1,id:"minecraft:leather"},{Slot:8b,count:1,id:"minecraft:leather"}],components:{}}

assert not data block ~2 ~ ~ Items[9]
assert block ~2 ~ ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:0b,count:2,id:"minecraft:raw_iron"},{Slot:1b,count:1,id:"minecraft:raw_iron"},{Slot:2b,count:1,id:"minecraft:raw_iron"},{Slot:3b,count:1,id:"minecraft:raw_iron"},{Slot:4b,count:1,id:"minecraft:raw_iron"},{Slot:5b,count:1,id:"minecraft:raw_iron"},{Slot:6b,count:1,id:"minecraft:raw_iron"},{Slot:7b,count:1,id:"minecraft:raw_iron"},{Slot:8b,count:1,id:"minecraft:raw_iron"}],components:{}}

assert not data block ~4 ~ ~ Items[9]
assert block ~4 ~ ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:0b,count:2,id:"minecraft:diamond"},{Slot:1b,count:1,id:"minecraft:diamond"},{Slot:2b,count:1,id:"minecraft:diamond"},{Slot:3b,count:1,id:"minecraft:diamond"},{Slot:4b,count:1,id:"minecraft:diamond"},{Slot:5b,count:1,id:"minecraft:diamond"},{Slot:6b,count:1,id:"minecraft:diamond"},{Slot:7b,count:1,id:"minecraft:diamond"},{Slot:8b,count:1,id:"minecraft:diamond"}],components:{}}




make_transfer()

assert score #success_transfer itemio.io matches 1

assert not data block ~2 ~2 ~ Items[5]
assert block ~2 ~2 ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:4b,count:1,id:"minecraft:diamond"},{Slot:5b,count:1,id:"minecraft:diamond"},{Slot:6b,count:1,id:"minecraft:raw_iron"},{Slot:7b,count:1,id:"minecraft:leather"},{Slot:8b,count:1,id:"minecraft:leather"}],components:{}}

assert not data block ~ ~ ~ Items[9]
assert block ~ ~ ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:0b,count:2,id:"minecraft:leather"},{Slot:1b,count:1,id:"minecraft:leather"},{Slot:2b,count:1,id:"minecraft:leather"},{Slot:3b,count:1,id:"minecraft:leather"},{Slot:4b,count:1,id:"minecraft:leather"},{Slot:5b,count:1,id:"minecraft:leather"},{Slot:6b,count:1,id:"minecraft:leather"},{Slot:7b,count:1,id:"minecraft:leather"},{Slot:8b,count:1,id:"minecraft:leather"}],components:{}}

assert not data block ~2 ~ ~ Items[9]
assert block ~2 ~ ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:0b,count:3,id:"minecraft:raw_iron"},{Slot:1b,count:1,id:"minecraft:raw_iron"},{Slot:2b,count:1,id:"minecraft:raw_iron"},{Slot:3b,count:1,id:"minecraft:raw_iron"},{Slot:4b,count:1,id:"minecraft:raw_iron"},{Slot:5b,count:1,id:"minecraft:raw_iron"},{Slot:6b,count:1,id:"minecraft:raw_iron"},{Slot:7b,count:1,id:"minecraft:raw_iron"},{Slot:8b,count:1,id:"minecraft:raw_iron"}],components:{}}

assert not data block ~4 ~ ~ Items[9]
assert block ~4 ~ ~ minecraft:dispenser[facing=south,triggered=false]{Items:[{Slot:0b,count:2,id:"minecraft:diamond"},{Slot:1b,count:1,id:"minecraft:diamond"},{Slot:2b,count:1,id:"minecraft:diamond"},{Slot:3b,count:1,id:"minecraft:diamond"},{Slot:4b,count:1,id:"minecraft:diamond"},{Slot:5b,count:1,id:"minecraft:diamond"},{Slot:6b,count:1,id:"minecraft:diamond"},{Slot:7b,count:1,id:"minecraft:diamond"},{Slot:8b,count:1,id:"minecraft:diamond"}],components:{}}

