# @template itemio:simple_transfer


await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004


scoreboard players set #max_output_count itemio.io 1
data modify storage itemio:io output_side set value "wireless"
data remove storage itemio:io input 
data remove storage itemio:io filters 

summon marker ~ ~ ~ {Tags:["itemio.transfer.destination","dummy"],data:{itemio:{input_side:"wireless"}}}
execute positioned ~ ~2 ~ run function #itemio:calls/transfer
kill @e[tag=dummy]

assert block ~ ~2 ~ minecraft:barrel[facing=south,open=false]{Items:[{Slot:13b,count:63,id:"minecraft:oak_planks"}],components:{}}
assert block ~ ~ ~ minecraft:barrel[facing=south,open=false]{Items:[{Slot:0b,count:1,id:"minecraft:oak_planks"}],components:{}}
assert score #success_transfer itemio.io matches 1



