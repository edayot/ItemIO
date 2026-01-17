
execute unless block ~ ~ ~ hopper{TransferCooldown: 0} run return fail



summon marker ~ ~ ~ {data:{itemio:{ioconfig:{input_side:"top"}}},Tags:["itemio.transfer.destination","itemio.transfer.destination.temp","itemio.summoned"]}


scoreboard players set #max_output_count itemio.io 1
data remove storage itemio:io filters
data remove storage itemio:io input
data modify storage itemio:io output_side set value "bottom"
execute positioned ~ ~1 ~ run function #itemio:calls/transfer


execute if score #success_transfer itemio.io matches 1 run data modify block ~ ~ ~ TransferCooldown set value 8


kill @e[tag=itemio.transfer.destination.temp]


