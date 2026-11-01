
# slots[0] : the next slot config usable from the output side
data modify storage itemio:main.output slot set from storage itemio:main.output slots[0]
data remove storage itemio:main.output slots[0]

data remove storage itemio:main.output temp.args_check_filters
execute store result storage itemio:main.output temp.args_check_filters.Slot int 1 run data get storage itemio:main.output slot.Slot
data modify storage itemio:main.output temp.args_check_filters.nbt_items_path set from storage itemio:main.output config.nbt_items_path

function itemio:impl/container/output/custom/output_noconfig/repart with storage itemio:main.output temp.args_check_filters

execute unless score #success_output itemio.io matches 1 if data storage itemio:main.output slots[0] run function itemio:impl/container/output/custom/output_noconfig/loop
