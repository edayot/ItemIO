say iteration

scoreboard players set #loaded itemio.math 0
execute if loaded -30000000 20 1610 run function itemio:impl/load_3
execute if score #loaded itemio.math matches 0 run forceload add -30000000 1600
execute if score #loaded itemio.math matches 0 run schedule function itemio:impl/load_2 1t