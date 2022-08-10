execute store result score #if_item_input itemio.math if data storage itemio:main input
execute if score #if_item_input itemio.math matches 1 run function itemio:container/output/custom/try_output/top
execute if score #if_item_input itemio.math matches 0 run function itemio:container/output/custom/try_output_nocheck/top


