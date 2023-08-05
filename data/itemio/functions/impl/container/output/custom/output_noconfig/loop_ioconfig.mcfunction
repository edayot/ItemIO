#$say $(output_side)


$execute if data storage itemio:main.output ioconfig[0].allowed_side{$(output_side):1b} run function itemio:impl/container/output/custom/output_noconfig/repart

execute if data storage itemio:io {output_side:"wireless"} run function itemio:impl/container/output/custom/output_noconfig/repart


data remove storage itemio:main.output ioconfig[0]
execute if data storage itemio:main.output ioconfig[0] unless score #success_output itemio.io matches 1 run function itemio:impl/container/output/custom/output_noconfig/loop_ioconfig with storage itemio:main.output temp.args_loop_ioconfig
