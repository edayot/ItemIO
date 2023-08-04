#$say $(output_side)

data remove storage itemio:main.input temp.args_check_filters
data modify storage itemio:main.input temp.args_check_filters.Slot set from storage itemio:main.input ioconfig[0].Slot
execute store result storage itemio:main.input temp.args_check_filters.Slot int 1 run data get storage itemio:main.input temp.args_check_filters.Slot



$execute if data storage itemio:main.output ioconfig[0].allowed_side{$(output_side):1b} run function itemio:impl/container/output/custom/output_no_config/check_filters with storage itemio:main.output temp.args_check_filters

execute if data storage itemio:io {output_side:"wireless"} run function itemio:impl/container/output/custom/output_no_config/check_filters with storage itemio:main.output temp.args_check_filters


data remove storage itemio:main.output ioconfig[0]
execute if data storage itemio:main.output ioconfig[0] unless score #success_output itemio.io matches 1 run function itemio:impl/container/output/custom/output_no_config/loop_ioconfig with storage itemio:main.output temp.args_loop_ioconfig
