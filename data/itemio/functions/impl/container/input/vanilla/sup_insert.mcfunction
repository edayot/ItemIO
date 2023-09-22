scoreboard players set #temp_slot itemio.math.input 0

execute if score #success_input itemio.io matches 0 if score #temp_slot itemio.math.input < #block_size itemio.math.input run function itemio:impl/container/input/vanilla/sup_insert/loop



