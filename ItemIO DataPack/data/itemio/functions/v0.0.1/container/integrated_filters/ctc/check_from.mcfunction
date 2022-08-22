scoreboard players set #!same_ctc_from itemio.math 1
data modify storage itemio:main from1 set value ""
data modify storage itemio:main from2 set value ""
data modify storage itemio:main from1 set from storage itemio:io filter.ctc.from
data modify storage itemio:main from2 set from storage itemio:io item.tag.ctc.from

execute store success score #!same_ctc_from itemio.math run data modify storage itemio:main from1 set from storage itemio:main from2