$execute store success score #if_item itemio.math.input if data storage itemio:main.input Items[{Slot:$(Slot)b}]

execute if score #if_item itemio.math.input matches 0 run function itemio:impl/container/input/custom/input_no_config/process_input/unless_item with storage itemio:main.input temp.args
execute if score #if_item itemio.math.input matches 1 run function itemio:impl/container/input/custom/input_no_config/process_input/if_item with storage itemio:main.input temp.args



#$tellraw @a [{"text":"Slot $(Slot) : "},{"score":{"name":"#if_item","objective":"itemio.math.input"}}]



