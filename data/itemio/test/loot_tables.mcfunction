
say starting loot_tables test

await delay 2s
await score #loaded itemio.math matches 1
await entity 93682a08-d099-4e8f-a4a6-1e33a3692301




setblock ~ ~2 ~ yellow_shulker_box{Items:[{Slot:1b,id:"minecraft:bow",count:1}]} replace

dummy jeb_ leave
dummy jeb_ spawn
dummy jeb_ respawn

await delay 2s

clear jeb_

loot give jeb_ mine ~ ~2 ~ command_block[minecraft:custom_data={drop_contents:1b}]

assert data entity jeb_ SelectedItem{id:"minecraft:bow"}

dummy jeb_ leave
