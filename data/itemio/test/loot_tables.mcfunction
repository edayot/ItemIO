
await delay 2s
await score #loaded itemio.math matches 1
await entity a97c9c67-fde0-4b89-926d-54fa4a866004




setblock ~ ~2 ~ yellow_shulker_box{Items:[{Slot:1b,id:"minecraft:bow",count:1}]} replace

dummy jeb_ leave
dummy jeb_ spawn
dummy jeb_ respawn

await delay 2s

clear jeb_

loot give jeb_ mine ~ ~2 ~ command_block[minecraft:custom_data={drop_contents:1b}]
loot give jeb_ mine ~ ~2 ~ command_block[minecraft:custom_data={drop_contents:0b}]

assert data entity jeb_ Inventory[{Slot:0b, id:"minecraft:bow"}]
assert data entity jeb_ Inventory[{Slot:1b, id:"minecraft:yellow_shulker_box"}]

dummy jeb_ leave
