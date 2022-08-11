kill 00000000-792c-4877-9654-b8805ab5f8d7
summon marker ~ ~ ~ {UUID:[I;0,2032945271,-1772832640,1521875159]}

#Bottom
kill 00000001-792c-4877-9654-b8805ab5f8d7
data remove storage itemio:io filter
data remove storage itemio:io input
scoreboard players set #max_output_count itemio.math 1

data modify storage itemio:io input_side set value "top"
data modify storage itemio:io output_side set value "bottom"

summon marker ~ ~-1 ~ {UUID:[I;1,2032945271,-1772832640,1521875159]}

function itemio:calls/transfer

#Top 
kill 00000001-792c-4877-9654-b8805ab5f8d7
data remove storage itemio:io filter
data remove storage itemio:io input
scoreboard players set #max_output_count itemio.math 1

data modify storage itemio:io input_side set value "bottom"
data modify storage itemio:io output_side set value "top"

summon marker ~ ~1 ~ {UUID:[I;1,2032945271,-1772832640,1521875159]}

function itemio:calls/transfer

#North
kill 00000001-792c-4877-9654-b8805ab5f8d7
data remove storage itemio:io filter
data remove storage itemio:io input
scoreboard players set #max_output_count itemio.math 1

data modify storage itemio:io input_side set value "south"
data modify storage itemio:io output_side set value "north"

summon marker ~ ~ ~-1 {UUID:[I;1,2032945271,-1772832640,1521875159]}

function itemio:calls/transfer

#South
kill 00000001-792c-4877-9654-b8805ab5f8d7
data remove storage itemio:io filter
data remove storage itemio:io input
scoreboard players set #max_output_count itemio.math 1

data modify storage itemio:io input_side set value "north"
data modify storage itemio:io output_side set value "south"

summon marker ~ ~ ~1 {UUID:[I;1,2032945271,-1772832640,1521875159]}

function itemio:calls/transfer


#East
kill 00000001-792c-4877-9654-b8805ab5f8d7
data remove storage itemio:io filter
data remove storage itemio:io input
scoreboard players set #max_output_count itemio.math 1

data modify storage itemio:io input_side set value "west"
data modify storage itemio:io output_side set value "east"

summon marker ~1 ~ ~ {UUID:[I;1,2032945271,-1772832640,1521875159]}

function itemio:calls/transfer

#West
kill 00000001-792c-4877-9654-b8805ab5f8d7
data remove storage itemio:io filter
data remove storage itemio:io input
scoreboard players set #max_output_count itemio.math 1

data modify storage itemio:io input_side set value "east"
data modify storage itemio:io output_side set value "west"

summon marker ~-1 ~ ~ {UUID:[I;1,2032945271,-1772832640,1521875159]}

function itemio:calls/transfer


#Reset
kill 00000001-792c-4877-9654-b8805ab5f8d7
kill 00000000-792c-4877-9654-b8805ab5f8d7
