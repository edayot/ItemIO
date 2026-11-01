# The container (@s) handles its outputs itself, in #itemio:event/auto_handled_output
# It offers its stacks one by one with #itemio:calls/offer, until one is taken
#   Inputs (read only) : storage itemio:io filters, storage itemio:io input, storage itemio:io output_side,
#                        score #max_output_count itemio.io

data remove storage itemio:io output
data remove storage itemio:main.output auto
data modify storage itemio:main.output auto.input set from storage itemio:io input
data modify storage itemio:main.output auto.filters set from storage itemio:io filters

execute store result score #auto_filters itemio.math.output if data storage itemio:main.output auto.filters[0]
execute store result score #auto_input itemio.math.output if data storage itemio:main.output auto.input

function #itemio:event/auto_handled_output
