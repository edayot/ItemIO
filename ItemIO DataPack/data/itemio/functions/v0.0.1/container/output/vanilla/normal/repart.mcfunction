execute if score #if_filter_define itemio.math.output matches 1 run function itemio:v0.0.1/container/output/vanilla/normal/test_filter


execute if score #if_filter_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 1 run function itemio:v0.0.1/container/output/vanilla/normal/test_nbt
execute if score #if_filter_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 0 run function itemio:v0.0.1/container/output/vanilla/normal/output



