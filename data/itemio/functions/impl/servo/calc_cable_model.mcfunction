scoreboard players operation #model_final_temp itemio.math = #model_final itemio.math
execute 
    if data entity @s {Facing:0b} 
    run function ~/down:
        scoreboard players operation #model_final_temp itemio.math %= #2 itemio.math
        execute if score #model_final_temp itemio.math matches 0 run scoreboard players add #model_final itemio.math 1
execute
    if data entity @s {Facing:1b} 
    run function ~/up:
        scoreboard players operation #model_final_temp itemio.math /= #2 itemio.math
        scoreboard players operation #model_final_temp itemio.math %= #2 itemio.math
        execute if score #model_final_temp itemio.math matches 0 run scoreboard players add #model_final itemio.math 2
execute 
    if data entity @s {Facing:2b} 
    run function ~/north:
        scoreboard players operation #model_final_temp itemio.math /= #8 itemio.math
        scoreboard players operation #model_final_temp itemio.math %= #2 itemio.math
        execute if score #model_final_temp itemio.math matches 0 run scoreboard players add #model_final itemio.math 8
execute 
    if data entity @s {Facing:3b} 
    run function ~/south:
        scoreboard players operation #model_final_temp itemio.math /= #4 itemio.math
        scoreboard players operation #model_final_temp itemio.math %= #2 itemio.math
        execute if score #model_final_temp itemio.math matches 0 run scoreboard players add #model_final itemio.math 4

execute
    if data entity @s {Facing:4b} 
    run function ~/west:
        scoreboard players operation #model_final_temp itemio.math /= #32 itemio.math
        scoreboard players operation #model_final_temp itemio.math %= #2 itemio.math
        execute if score #model_final_temp itemio.math matches 0 run scoreboard players add #model_final itemio.math 32
execute
    if data entity @s {Facing:5b} 
    run function ~/east:
        scoreboard players operation #model_final_temp itemio.math /= #16 itemio.math
        scoreboard players operation #model_final_temp itemio.math %= #2 itemio.math
        execute if score #model_final_temp itemio.math matches 0 run scoreboard players add #model_final itemio.math 16