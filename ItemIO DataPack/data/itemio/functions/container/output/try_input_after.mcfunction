
#tellraw @p [{"text":"try input after : "},{"nbt":"output","storage":"itemio:io"}]
data modify storage itemio:io input set from storage itemio:io output
execute at 00000001-792c-4877-9654-b8805ab5f8d7 run function #itemio:calls/input

execute if score #success_input itemio.math.input matches 1 run scoreboard players operation #remove_count itemio.math.output = #count_to_remove itemio.math.input
execute if score #success_input itemio.math.input matches 0 run scoreboard players set #remove_count itemio.math.output 0