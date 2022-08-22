

execute if data storage itemio:main.output ioconfig[0].allowed_side{east:1b} run function itemio:v0.0.1/container/output/custom/try_output/repart_nocheck
data remove storage itemio:main.output ioconfig[0]
execute if score #success_output itemio.math.output matches 0 if data storage itemio:main.output ioconfig[0] run function itemio:v0.0.1/container/output/custom/try_output_nocheck/east
