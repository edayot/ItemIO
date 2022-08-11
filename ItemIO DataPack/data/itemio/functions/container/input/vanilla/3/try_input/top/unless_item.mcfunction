execute store result score #count_input itemio.math run data get storage itemio:main.input input.Count


data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage itemio:main.input input.id
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack16 run scoreboard players set #full_stack itemio.math 16
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack1 run scoreboard players set #full_stack itemio.math 1

execute if score #count_input itemio.math > #full_stack itemio.math store result storage itemio:main.input input.Count int 1 run scoreboard players get #full_stack itemio.math

setblock -30000000 22 1610 yellow_shulker_box
data modify block -30000000 22 1610 Items append from storage itemio:main.input input

loot replace block ~ ~ ~ container.0 mine -30000000 22 1610 air{drop_contents:1b}


scoreboard players set #success_input itemio.math 1
execute if score #count_input itemio.math > #full_stack itemio.math run scoreboard players operation #count_input itemio.math -= #full_stack itemio.math
execute if score #count_input itemio.math <= #full_stack itemio.math run scoreboard players set #count_input itemio.math 0
execute if score #count_input itemio.math <= #full_stack itemio.math run scoreboard players set #full_input itemio.math 1


execute store result storage itemio:main.input input.Count int 1 run scoreboard players get #count_input itemio.math



