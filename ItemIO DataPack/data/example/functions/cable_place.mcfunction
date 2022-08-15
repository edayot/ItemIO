summon marker ~ ~ ~ {Tags:["itemio.cable","itemio.cable.summoned","itemio.network"]}
setblock ~ ~ ~ conduit[waterlogged=false]
execute as @e[type=marker,tag=itemio.cable.summoned] run function itemio:cable/init

tag @e[type=marker,tag=itemio.cable.summoned] remove itemio.cable.summoned