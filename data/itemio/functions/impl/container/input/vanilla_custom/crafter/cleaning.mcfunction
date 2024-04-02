





$data modify storage itemio:main.input temp.is_disabled set from storage itemio:main.input disabled_slots[$(slot_clean)]


data remove storage itemio:main.input temp.item_crafter
data modify storage itemio:main.input temp.item_crafter set value {id:"minecraft:air",count:0}
data modify storage itemio:main.input temp.item_crafter set from storage








scoreboard players add #slot_clean itemio.math.input 1
execute 
    store result storage itemio:main.input args.slot_clean int 1 
    run scoreboard players get #slot_clean itemio.math.input

execute
    if tagrandmere
    run function . with storage itemio:main.input args