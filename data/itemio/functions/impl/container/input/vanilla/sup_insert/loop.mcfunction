
data remove storage itemio:main.input temp.args
execute store result storage itemio:main.input temp.args.Slot int 1 run scoreboard players get #temp_slot itemio.math.input
function itemio:impl/container/input/custom/input_no_config/process_input with storage itemio:main.input temp.args



scoreboard players add #temp_slot itemio.math.input 1
execute if score #temp_slot itemio.math.input < #block_size itemio.math.input run function itemio:impl/container/input/vanilla/sup_insert/loop
