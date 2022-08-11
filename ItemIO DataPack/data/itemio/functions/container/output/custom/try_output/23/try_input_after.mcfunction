

data modify storage itemio:io input set from storage itemio:io output
execute at 00000001-792c-4877-9654-b8805ab5f8d7 run function #itemio:calls/input

execute if score #success_input itemio.math.input matches 1 run item modify block ~ ~ ~ container.23 itemio:input/remove_count_origin
execute if score #success_input itemio.math.input matches 1 run scoreboard players set #success_transfer itemio.math 1
execute if score #success_input itemio.math.input matches 0 run scoreboard players set #success_output itemio.math.output 0
