



data remove storage itemio:io filters
data modify storage itemio:io filters set from storage itemio:main.input ioconfig[0].filters
data modify storage itemio:io item set from storage itemio:main.input input

function #itemio:calls/filters_v2


data remove storage itemio:main.input temp.args
data modify storage itemio:main.input temp.args.Slot set from storage itemio:main.input ioconfig[0].Slot
execute store result storage itemio:main.input temp.args.Slot int 1 run data get storage itemio:main.input temp.args.Slot


execute if score #filters.valid_item itemio.io matches 1 run function itemio:impl/container/input/custom/input_no_config/process_input with storage itemio:main.input temp.args


