execute if score itemio.minor load.status matches ..0 unless score itemio.minor load.status matches 0 run function itemio:v0.0.1/load/enumerate/set_version
execute unless score itemio load.status matches 1 if score itemio.minor load.status matches ..0 if score itemio.minor load.status matches 0 run function itemio:v0.0.1/load/enumerate/patch




