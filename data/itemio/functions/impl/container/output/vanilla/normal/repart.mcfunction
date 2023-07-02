execute if score #if_filters_define itemio.math.output matches 1 run function itemio:impl/container/output/vanilla/normal/test_filters


execute if score #if_filters_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 1 run function itemio:impl/container/output/vanilla/normal/test_nbt
execute if score #if_filters_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 0 run function itemio:impl/container/output/vanilla/normal/output



