$say $(input_side)

$execute if data storage itemio:main.input ioconfig[0].allowed_side{$(input_side):1b} run function itemio:impl/container/input/custom/input_no_config/process_input

execute if data storage itemio:io {input_side:"wireless"} run function itemio:impl/container/input/custom/input_no_config/process_input


data remove storage itemio:main.input ioconfig[0]
execute if data storage itemio:main.input ioconfig[0] run function itemio:impl/container/input/custom/input_no_config/loop_ioconfig
