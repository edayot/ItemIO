execute if score #if_filter_define itemio.math.output matches 1 run function itemio:container/output/vanilla/3/bottom/test_filter


execute if score #if_filter_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 1 run function itemio:container/output/vanilla/3/bottom/test_nbt
execute if score #if_filter_define itemio.math.output matches 0 if score #if_item_input itemio.math.output matches 0 run function itemio:container/output/vanilla/3/bottom/output



