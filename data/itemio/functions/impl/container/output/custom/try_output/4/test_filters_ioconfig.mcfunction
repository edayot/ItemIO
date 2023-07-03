


data remove storage itemio:io item
data modify storage itemio:io item set from storage itemio:main.output Items[{Slot:4b}]

data modify storage itemio:io filters set value []
data modify storage itemio:io filters append from storage itemio:main.output ioconfig[0].filters[]
#tellraw @a {"nbt":"filters","storage":"itemio:io"}
#tellraw @a {"nbt":"item","storage":"itemio:io"}

function #itemio:calls/filters_v2

execute if score #filters.valid_item itemio.io matches 1 run function itemio:impl/container/output/custom/try_output/4/output






