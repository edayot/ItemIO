data remove storage itemio:io filter
data remove storage itemio:io input


scoreboard players operation #max_output_count itemio.math.output = @s itemio.servo.stack_limit

execute positioned ^ ^ ^-1 align xyz positioned ~.5 ~.5 ~.5 run function #itemio:calls/transfer

