

#Bottom

data remove storage itemio:io filter
data remove storage itemio:io input


data modify storage itemio:io output_side set value "bottom"

summon marker ~ ~-1 ~ {Tags:["itemio.transfer.destination","itemio.transfer.destination.temp"],data:{itemio:{input_side:"top"}}}

function itemio:calls/transfer

#Top 

data remove storage itemio:io filter
data remove storage itemio:io input


data modify storage itemio:io output_side set value "top"

summon marker ~ ~1 ~ {Tags:["itemio.transfer.destination","itemio.transfer.destination.temp"],data:{itemio:{input_side:"bottom"}}}

function itemio:calls/transfer

#North

data remove storage itemio:io filter
data remove storage itemio:io input


data modify storage itemio:io output_side set value "north"

summon marker ~ ~ ~-1 {Tags:["itemio.transfer.destination","itemio.transfer.destination.temp"],data:{itemio:{input_side:"south"}}}

function itemio:calls/transfer

#South

data remove storage itemio:io filter
data remove storage itemio:io input


data modify storage itemio:io output_side set value "south"

summon marker ~ ~ ~1 {Tags:["itemio.transfer.destination","itemio.transfer.destination.temp"],data:{itemio:{input_side:"north"}}}

function itemio:calls/transfer


#East

data remove storage itemio:io filter
data remove storage itemio:io input


data modify storage itemio:io output_side set value "east"

summon marker ~1 ~ ~ {Tags:["itemio.transfer.destination","itemio.transfer.destination.temp"],data:{itemio:{input_side:"east"}}}

function itemio:calls/transfer

#West

data remove storage itemio:io filter
data remove storage itemio:io input


data modify storage itemio:io output_side set value "west"

summon marker ~-1 ~ ~ {Tags:["itemio.transfer.destination","itemio.transfer.destination.temp"],data:{itemio:{input_side:"west"}}}

function itemio:calls/transfer

kill @e[tag=itemio.transfer.destination.temp]
