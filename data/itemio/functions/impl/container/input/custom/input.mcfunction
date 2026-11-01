
#loading config
function itemio:impl/container/input/read_config
data remove storage itemio:main.input config.ioconfig[{mode:"output"}]

scoreboard players set #good_context_entity itemio.math.input 1
execute if data storage itemio:main.input config.ioconfig[0] if data storage itemio:io input run function itemio:impl/container/input/custom/input_noconfig
scoreboard players set #good_context_entity itemio.math.input 0
