execute if data storage itemio:main ioconfig[0].allowed_side{east:1b} run function itemio:working/custom/repart
data remove storage itemio:main ioconfig[0]
execute if data storage itemio:main ioconfig[0] run function itemio:working/custom/try_input/east
