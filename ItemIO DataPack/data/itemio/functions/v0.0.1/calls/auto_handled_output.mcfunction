
#A item arrive from : storage itemio:io Item_auto_output

execute if score itemio.major load.status matches 0 if score itemio.minor load.status matches 0 if score itemio.patch load.status matches 1 run function itemio:v0.0.1/container/auto_handled_output/repart
