
execute at @s align xyz run summon marker ~.5 ~.5 ~.5 {data:{itemio:{ioconfig:{input_side:"south"}}},Tags:["itemio.transfer.destination","itemio.transfer.destination.temp","itemio.summoned"]}


scoreboard players set #max_output_count itemio.math.output 1
data remove storage itemio:io filter
data remove storage itemio:io input
data modify storage itemio:io output_side set value "north"
function #itemio:calls/transfer

kill @e[tag=itemio.transfer.destination.temp]

function itemio:v0.0.1/container/hopper/vanilla_input