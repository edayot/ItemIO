$say $(input_side)

$execute if data storage itemio:main.input ioconfig[0].allowed_side{$(input_side):1b} run function itemio:impl/container/input/custom/input_no_config/check_filters with storage itemio:main.input temp.args

execute if data storage itemio:io {input_side:"wireless"} run function itemio:impl/container/input/custom/input_no_config/check_filters


data remove storage itemio:main.input ioconfig[0]
execute if score #success_input itemio.io matches 0 if data storage itemio:main.input ioconfig[0] run function itemio:impl/container/input/custom/input_no_config/loop_ioconfig
