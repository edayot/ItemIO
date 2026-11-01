
# Executed at the destination
data remove storage itemio:io input_side
data modify storage itemio:io input_side set from storage itemio:main transfer.current.input_side

data modify storage itemio:io input set from storage itemio:io output
execute
    if data storage itemio:main transfer.current.stack_limit
    store result score #stack_limit itemio.math
    run data get storage itemio:main transfer.current.stack_limit
execute store result score #input_size itemio.math run data get storage itemio:io output.count
execute
    if data storage itemio:main transfer.current.stack_limit
    if score #stack_limit itemio.math < #input_size itemio.math
    store result storage itemio:io input.count int 1
    run scoreboard players get #stack_limit itemio.math


#tellraw @a {"nbt":"input","storage":"itemio:io"}

function itemio:impl/container/input/repart
