data remove storage itemio:main.input temp.args
data modify storage itemio:main.input temp.args.Slot set value 1
function itemio:impl/container/input/custom/input_no_config/process_input with storage itemio:main.input temp.args

