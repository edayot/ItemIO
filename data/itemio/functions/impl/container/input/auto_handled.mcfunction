# The container (@s) handles its inputs itself, in #itemio:event/auto_handled_input
#   Inputs : storage itemio:io input, storage itemio:io input_side
#   Output : score #count_to_remove itemio.io, the count accepted by the container (0 before the event)
# The other outputs (#success_input, itemio:io output) and the servos cooldown are handled here

scoreboard players set #count_to_remove itemio.io 0
function #itemio:event/auto_handled_input

execute store result score #count_input itemio.math.input run data get storage itemio:io input.count
execute if score #count_to_remove itemio.io > #count_input itemio.math.input run scoreboard players operation #count_to_remove itemio.io = #count_input itemio.math.input
execute if score #count_to_remove itemio.io matches 1.. run scoreboard players set #success_input itemio.io 1

scoreboard players operation #remaining itemio.math.input = #count_input itemio.math.input
scoreboard players operation #remaining itemio.math.input -= #count_to_remove itemio.io
data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
execute store result storage itemio:io output.count int 1 run scoreboard players get #remaining itemio.math.input

execute if score #success_input itemio.io matches 0 if score #servos_transfer itemio.math matches 1 run function itemio:impl/container/input/disable_servo
