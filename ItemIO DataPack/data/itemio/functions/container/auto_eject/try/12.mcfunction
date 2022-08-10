
scoreboard players set #success_input itemio.math 0
data modify storage itemio:io input set from storage itemio:main Items2[{Slot:12b}]

#Check max_count
execute store result score #count_input itemio.math run data get storage itemio:io input.Count
execute if score #count_input itemio.math > #max_count itemio.math store result storage itemio:io input.Count int 1 run scoreboard players get #max_count itemio.math



execute if data storage itemio:main ioconfig2[0].allowed_side{north:1b} positioned ~ ~ ~-1 run function itemio:container/auto_eject/try/0/south
execute if score #success_input itemio.math matches 0 if data storage itemio:main ioconfig2[0].allowed_side{south:1b} positioned ~ ~ ~1 run function itemio:container/auto_eject/try/side/north
execute if score #success_input itemio.math matches 0 if data storage itemio:main ioconfig2[0].allowed_side{east:1b} positioned ~1 ~ ~ run function itemio:container/auto_eject/try/side/west
execute if score #success_input itemio.math matches 0 if data storage itemio:main ioconfig2[0].allowed_side{west:1b} positioned ~-1 ~ ~ run function itemio:container/auto_eject/try/side/east
execute if score #success_input itemio.math matches 0 if data storage itemio:main ioconfig2[0].allowed_side{top:1b} positioned ~ ~1 ~ run function itemio:container/auto_eject/try/side/bottom
execute if score #success_input itemio.math matches 0 if data storage itemio:main ioconfig2[0].allowed_side{bottom:1b} positioned ~ ~-1 ~ run function itemio:container/auto_eject/try/side/top

execute if score #success_input itemio.math matches 1 run item modify block ~ ~ ~ container.12 itemio:input/remove_count_origin

