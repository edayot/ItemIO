

scoreboard players set #double_chests itemio.math 1
scoreboard players set #block_size itemio.math.input 27
function itemio:impl/container/input/vanilla/try_input
scoreboard players set #double_chests itemio.math 0


execute if score #success_input itemio.io matches 0 positioned ~-1 ~ ~ if block ~ ~ ~ #itemio:container/chests[facing=north,type=left] run function itemio:impl/container/input/vanilla/try_input