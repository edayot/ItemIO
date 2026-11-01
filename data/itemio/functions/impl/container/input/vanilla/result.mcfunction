# What's left of the input, and the count to remove from its origin

data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
execute store result storage itemio:io output.count int 1 run scoreboard players get #remaining itemio.math.input

scoreboard players operation #count_to_remove itemio.io = #count_input itemio.math.input
scoreboard players operation #count_to_remove itemio.io -= #remaining itemio.math.input
