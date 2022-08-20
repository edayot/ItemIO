data remove storage itemio:io filter
data remove storage itemio:io input


data modify storage itemio:io filter set from storage itemio:main servo_items[0]

scoreboard players operation #max_output_count itemio.math.output = @s itemio.servo.stack_limit

execute positioned ^ ^ ^-1 align xyz positioned ~.5 ~.5 ~.5 run function #itemio:calls/transfer

data remove storage itemio:main servo_items[0]
execute if score #success_transfer itemio.math matches 0 if data storage itemio:main servo_items[0] run function itemio:servo/make_transfer_items
