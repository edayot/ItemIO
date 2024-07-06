scoreboard players operation @s itemio.network_id.low = #temp_low itemio.math
scoreboard players operation @s itemio.network_id.high = #temp_high itemio.math

scoreboard players operation @s itemio.network.process_queue = #temp_low itemio.math
scoreboard players operation @s itemio.network.process_queue %= #process_queue itemio.math


#tellraw @a ["Initial value : ",{"score":{"name":"#model_final","objective":"itemio.math"}}]
function itemio:impl/servo/calc_cable_model
#tellraw @a ["Final value : ",{"score":{"name":"#model_final","objective":"itemio.math"}}]
#tellraw @a ["% : ",{"score":{"name":"#model_final_temp","objective":"itemio.math"}}]


scoreboard players set @s itemio.math 1
function #itemio:event/network_update
