
#loading config
function itemio:impl/container/output/read_config
data remove storage itemio:main.output config.ioconfig[{mode:"input"}]

scoreboard players set #good_context_entity itemio.math.output 1
execute if data storage itemio:main.output config.ioconfig[0] run function itemio:impl/container/output/custom/output_noconfig
scoreboard players set #good_context_entity itemio.math.output 0
