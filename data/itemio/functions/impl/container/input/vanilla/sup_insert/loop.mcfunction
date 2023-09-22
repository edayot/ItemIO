
data remove storage itemio:main.input temp.args
execute store result storage itemio:main.input temp.args.Slot int 1 run scoreboard players get #temp_slot itemio.math.input
function itemio:impl/container/input/custom/input_no_config/process_input with storage itemio:main.input temp.args



scoreboard players add #temp_slot itemio.math.input 1
function itemio:impl/container/input/if_item_input
execute if score #temp_success_lol itemio.math.input matches 1 if score #temp_slot itemio.math.input < #block_size itemio.math.input run function itemio:impl/container/input/vanilla/sup_insert/loop