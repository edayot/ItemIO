
# The stack limit of this slot
scoreboard players operation #full_stack itemio.math.input = #stack_size itemio.math.input
execute
    if data storage itemio:main.input slot.max_stack_size
    store result score #config_max_stack_size itemio.math.input
    run data get storage itemio:main.input slot.max_stack_size
execute
    if data storage itemio:main.input slot.max_stack_size
    if score #full_stack itemio.math.input > #config_max_stack_size itemio.math.input
    run scoreboard players operation #full_stack itemio.math.input = #config_max_stack_size itemio.math.input

data remove storage itemio:main.input temp.args
execute store result storage itemio:main.input temp.args.Slot int 1 run data get storage itemio:main.input slot.Slot
data modify storage itemio:main.input temp.args.nbt_items_path set from storage itemio:main.input config.nbt_items_path

function itemio:impl/container/input/custom/input_no_config/process_input with storage itemio:main.input temp.args
