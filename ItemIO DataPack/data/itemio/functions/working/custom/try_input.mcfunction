execute store result score #slot itemio.math run data get storage itemio:io ioconfig[0].Slot


execute if score #slot itemio.math matches 0 run function itemio:working/custom/try_input/0/repart
execute if score #full_input itemio.math matches 0 if score #slot itemio.math matches 1 run function itemio:working/custom/try_input/1/repart

data remove storage itemio:io ioconfig[0]
execute if data storage itemio:io ioconfig[0] run function itemio:working/custom/try_input
