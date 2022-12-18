data remove storage itemio:main.input Items
data modify storage itemio:main.input Items set from block ~ ~ ~ Items
data remove storage itemio:main.input Items[{tag:{itemio:{gui:1b}}}]
data remove storage itemio:main.input Items[{tag:{simplenergy:{texture_item:1b}}}]

execute if data storage itemio:io {input_side:"top"} run function itemio:v0.0.1/container/input/vanilla/3/try_input/top
execute if data storage itemio:io {input_side:"bottom"} run function itemio:v0.0.1/container/input/vanilla/3/try_input/top
execute if data storage itemio:io {input_side:"north"} run function itemio:v0.0.1/container/input/vanilla/3/try_input/side
execute if data storage itemio:io {input_side:"south"} run function itemio:v0.0.1/container/input/vanilla/3/try_input/side
execute if data storage itemio:io {input_side:"east"} run function itemio:v0.0.1/container/input/vanilla/3/try_input/side
execute if data storage itemio:io {input_side:"west"} run function itemio:v0.0.1/container/input/vanilla/3/try_input/side