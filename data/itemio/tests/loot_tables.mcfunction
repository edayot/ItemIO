
setblock ~ ~2 ~ yellow_shulker_box{Items:[{Slot:1b,id:"minecraft:bow",Count:1b}]} replace

dummy jeb_ leave
dummy jeb_ spawn
dummy jeb_ respawn

await delay 2s

loot give jeb_ mine ~ ~2 ~ air{drop_contents:1b}

assert data entity jeb_ SelectedItem{id:"minecraft:bow"}

dummy jeb_ leave
