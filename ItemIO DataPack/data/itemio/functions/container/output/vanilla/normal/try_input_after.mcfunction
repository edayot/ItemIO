
#tellraw @p [{"text":"try input after : "},{"nbt":"output","storage":"itemio:io"}]
data modify storage itemio:io input set from storage itemio:io output
execute at 00000001-792c-4877-9654-b8805ab5f8d7 run function #itemio:calls/input

execute if score #success_input itemio.math.input matches 1 run function itemio:container/output/vanilla/normal/output_slot_input_after
execute if score #success_input itemio.math.input matches 0 run scoreboard players set #success_output itemio.math.output 0
execute if score #success_input itemio.math.input matches 0 run data remove storage itemio:main.output Items[0]
execute if score #success_input itemio.math.input matches 0 if data storage itemio:main.output Items[0] run function itemio:container/output/vanilla/normal/output
