

scoreboard players set #is_shulker_box itemio.math.input 0

data remove entity a97c9c67-fde0-4b89-926d-54fa4a866004 container.0
data modify entity a97c9c67-fde0-4b89-926d-54fa4a866004 container.0 set from storage itemio:io input

execute if items entity a97c9c67-fde0-4b89-926d-54fa4a866004 container.0 #itemio:shulker_boxes run return fail



function itemio:impl/container/input/vanilla/test_input

