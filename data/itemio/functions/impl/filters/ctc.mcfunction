scoreboard players set #filter.valid_item itemio.io 0

data remove storage itemio:main temp.ctc
data modify storage itemio:main temp.ctc set from storage itemio:io filter.ctc

execute if score #filter.valid_item itemio.io matches 0 if data storage itemio:main temp.ctc[0] run function itemio:impl/filters/ctc/loop


