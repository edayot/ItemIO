
# What's left of the input, and the count to remove from its origin
data remove storage itemio:io output
data modify storage itemio:io output set from storage itemio:io input
data modify storage itemio:io output.count set from storage itemio:main.input input.count

execute store result score #count_input itemio.math.input run data get storage itemio:io input.count
execute store result score #count_output itemio.math.input run data get storage itemio:io output.count

scoreboard players operation #count_to_remove itemio.math.input = #count_input itemio.math.input
scoreboard players operation #count_to_remove itemio.math.input -= #count_output itemio.math.input

scoreboard players operation #count_to_remove itemio.io = #count_to_remove itemio.math.input
