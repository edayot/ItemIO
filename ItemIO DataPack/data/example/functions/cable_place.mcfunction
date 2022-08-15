summon marker ~ ~ ~ {Tags:["itemio.cable","example.summoned","itemio.network","example.cable"]}
setblock ~ ~ ~ conduit[waterlogged=false]
execute as @e[type=marker,tag=example.summoned] run function itemio:cable/init

tag @e[type=marker,tag=example.summoned] remove example.summoned