

execute if data storage itemio:main ioconfig[0].allowed_side{north:1b} run function itemio:container/output/custom/try_output/repart_nocheck
data remove storage itemio:main ioconfig[0]
execute if data storage itemio:main ioconfig[0] run function itemio:container/output/custom/try_output_nocheck/north
