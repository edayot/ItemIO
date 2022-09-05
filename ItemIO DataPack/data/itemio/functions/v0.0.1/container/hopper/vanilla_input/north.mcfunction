#Enable vanilla extracting from the hopper

execute align xyz run summon marker ~.5 ~.5 ~.5 {data:{itemio:{ioconfig:{input_side:"north"}}},Tags:["itemio.transfer.destination","itemio.transfer.destination.temp","itemio.summoned"]}

scoreboard players set #max_output_count itemio.math.output 1
data remove storage itemio:io filter
data remove storage itemio:io input
data modify storage itemio:io output_side set value "south"
execute at @s positioned ~ ~-1 ~ align xyz positioned ~.5 ~.5 ~.5 unless entity @e[type=#itemio:container,tag=itemio.container,distance=..0.5001] run function #itemio:calls/transfer

kill @e[tag=itemio.transfer.destination.temp]
