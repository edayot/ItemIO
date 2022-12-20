data modify storage itemio:io input_side set from entity @s data.itemio.ioconfig.input_side

data modify storage itemio:io input set from storage itemio:io output
execute store result score #input_size itemio.math run data get storage itemio:io output.Count
execute if score @s itemio.servo.stack_limit < #input_size itemio.math store result storage itemio:io input.Count int 1 run scoreboard players get @s itemio.servo.stack_limit


function #itemio:calls/input