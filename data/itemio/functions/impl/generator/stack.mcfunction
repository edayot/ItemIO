

function itemio:impl/generator/set_storage

data modify storage itemio:main temp.result_furnace set value "["
data modify storage itemio:main temp.result_blast_furnace set value "["
data modify storage itemio:main temp.result_smoker set value "["
data modify storage itemio:main temp.result1 set value "["
data modify storage itemio:main temp.result16 set value "["
setblock -30000000 23 1610 barrel
setblock -30000000 24 1610 furnace
setblock -30000000 25 1610 blast_furnace
setblock -30000000 26 1610 smoker

scoreboard players set #count_input itemio.math.input 64
function itemio:impl/generator/stack_loop

data modify storage itemio:main temp.result16 set string storage itemio:main temp.result16 0 -1
data modify storage itemio:main temp.result1 set string storage itemio:main temp.result1 0 -1
data modify storage itemio:main temp.result_smoker set string storage itemio:main temp.result_smoker 0 -1
data modify storage itemio:main temp.result_blast_furnace set string storage itemio:main temp.result_blast_furnace 0 -1
data modify storage itemio:main temp.result_furnace set string storage itemio:main temp.result_furnace 0 -1

function itemio:impl/generator/add_end with storage itemio:main temp



