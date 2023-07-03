

scoreboard players set #!same_ctc_id itemio.math 1
data modify storage itemio:main temp.ctc1.id set value ""
data modify storage itemio:main temp.ctc2.id set value ""
data modify storage itemio:main temp.ctc1.id set from storage itemio:main temp.ctc[0].id
data modify storage itemio:main temp.ctc2.id set from storage itemio:io item.ctc.id

execute store success score #!same_ctc_id itemio.math run data modify storage itemio:main temp.ctc1.id set from storage itemio:main temp.ctc2.id


scoreboard players set #!same_ctc_from itemio.math 1
data modify storage itemio:main temp.ctc1.from set value ""
data modify storage itemio:main temp.ctc2.from set value ""
data modify storage itemio:main temp.ctc1.from set from storage itemio:main temp.ctc[0].from
data modify storage itemio:main temp.ctc2.from set from storage itemio:io item.ctc.from

execute store success score #!same_ctc_from itemio.math run data modify storage itemio:main temp.ctc1.from set from storage itemio:main temp.ctc2.from



scoreboard players set #!same_ctc itemio.math 0
execute if score #!same_ctc_id itemio.math matches 0 if score #!same_ctc_from itemio.math matches 0 run scoreboard players set #!same_ctc itemio.math 1


execute if score #!same_ctc itemio.math matches 0 run scoreboard players set #filter.valid_item itemio.io 1
execute if score #!same_ctc itemio.math matches 1 run data remove storage itemio:main temp.ctc[0]
execute if score #!same_ctc itemio.math matches 1 if data storage itemio:main temp.ctc[0] run function itemio:impl/filters/ctc/loop

