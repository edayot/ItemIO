

scoreboard players set #is_shulker_box itemio.math.input 0

data remove entity 93682a08-d099-4e8f-a4a6-1e33a3692301 equipment.mainhand
data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 equipment.mainhand set from storage itemio:io input

execute if items entity 93682a08-d099-4e8f-a4a6-1e33a3692301 weapon.mainhand #itemio:shulker_boxes run return fail



function itemio:impl/container/input/vanilla/test_input

