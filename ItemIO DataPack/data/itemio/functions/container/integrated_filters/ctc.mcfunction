scoreboard players set #valid_item itemio.math 0
scoreboard players set #!same_ctc_from itemio.math 0
scoreboard players set #!same_ctc_id itemio.math 0

execute if data storage itemio:io filter.ctc.from run function itemio:container/integrated_filters/ctc/check_from
execute if data storage itemio:io filter.ctc.id run function itemio:container/integrated_filters/ctc/check_id

execute if score #!same_ctc_from itemio.math matches 0 if score #!same_ctc_id itemio.math matches 0 run scoreboard players set #valid_item itemio.math 1