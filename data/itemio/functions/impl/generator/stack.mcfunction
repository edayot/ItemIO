

function itemio:impl/generator/set_storage

data modify storage itemio:main temp.result1 set value "["
data modify storage itemio:main temp.result16 set value "["
setblock -30000000 23 1610 barrel
scoreboard players set #count_input itemio.math.input 64
function itemio:impl/generator/stack_loop

data modify storage itemio:main temp.result16 set string storage itemio:main temp.result16 0 -1
data modify storage itemio:main temp.result1 set string storage itemio:main temp.result1 0 -1

function itemio:impl/generator/add_end with storage itemio:main temp



