scoreboard players operation #model_final_temp itemio.math = #model_final itemio.math

execute store result score #rotation_0 itemio.math run data get entity @s Rotation[0]
execute store result score #rotation_1 itemio.math run data get entity @s Rotation[1]

execute
    if score #rotation_0 itemio.math matches 0
    if score #rotation_1 itemio.math matches 90
    run function ~/down:
        scoreboard players operation #model_final_temp itemio.math %= #2 itemio.math
        execute if score #model_final_temp itemio.math matches 0 run scoreboard players add #model_final itemio.math 1
execute
    if score #rotation_0 itemio.math matches 0
    if score #rotation_1 itemio.math matches -90
    run function ~/up:
        scoreboard players operation #model_final_temp itemio.math /= #2 itemio.math
        scoreboard players operation #model_final_temp itemio.math %= #2 itemio.math
        execute if score #model_final_temp itemio.math matches 0 run scoreboard players add #model_final itemio.math 2
execute 
    if score #rotation_0 itemio.math matches 180
    if score #rotation_1 itemio.math matches 0
    run function ~/north:
        scoreboard players operation #model_final_temp itemio.math /= #8 itemio.math
        scoreboard players operation #model_final_temp itemio.math %= #2 itemio.math
        execute if score #model_final_temp itemio.math matches 0 run scoreboard players add #model_final itemio.math 8
execute 
    if score #rotation_0 itemio.math matches 0
    if score #rotation_1 itemio.math matches 0
    run function ~/south:
        scoreboard players operation #model_final_temp itemio.math /= #4 itemio.math
        scoreboard players operation #model_final_temp itemio.math %= #2 itemio.math
        execute if score #model_final_temp itemio.math matches 0 run scoreboard players add #model_final itemio.math 4

execute
    if score #rotation_0 itemio.math matches 90
    if score #rotation_1 itemio.math matches 0
    run function ~/west:
        say west
        scoreboard players operation #model_final_temp itemio.math /= #32 itemio.math
        scoreboard players operation #model_final_temp itemio.math %= #2 itemio.math
        execute if score #model_final_temp itemio.math matches 0 run scoreboard players add #model_final itemio.math 32
execute
    if score #rotation_0 itemio.math matches 270
    if score #rotation_1 itemio.math matches 0
    run function ~/east:
        scoreboard players operation #model_final_temp itemio.math /= #16 itemio.math
        scoreboard players operation #model_final_temp itemio.math %= #2 itemio.math
        execute if score #model_final_temp itemio.math matches 0 run scoreboard players add #model_final itemio.math 16