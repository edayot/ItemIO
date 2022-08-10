scoreboard players set #!same_ctc_id itemio.math 1
data modify storage itemio:main id1 set value ""
data modify storage itemio:main id2 set value ""
data modify storage itemio:main id1 set from storage itemio:io filter.ctc.id
data modify storage itemio:main id2 set from storage itemio:io item.tag.ctc.id

execute store success score #!same_ctc_id itemio.math run data modify storage itemio:main id1 set from storage itemio:main id2