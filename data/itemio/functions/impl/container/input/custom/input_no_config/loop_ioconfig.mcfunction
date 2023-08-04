#$say $(input_side)

$execute if data storage itemio:main.input ioconfig[0].allowed_side{$(input_side):1b} run function itemio:impl/container/input/custom/input_no_config/check_filters

execute if data storage itemio:io {input_side:"wireless"} run function itemio:impl/container/input/custom/input_no_config/check_filters


data remove storage itemio:main.input ioconfig[0]
execute unless function itemio:impl/container/input/if_item_input if data storage itemio:main.input ioconfig[0] run function itemio:impl/container/input/custom/input_no_config/loop_ioconfig with storage itemio:main.input temp.args_loop_ioconfig
