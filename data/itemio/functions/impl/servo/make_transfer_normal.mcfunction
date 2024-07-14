data remove storage itemio:io filters
data remove storage itemio:io input

data modify storage itemio:io filters set from storage itemio:main servo_filters
#tellraw @a {"nbt":"Item.components."minecraft:custom_data".itemio","entity":"@s"}


scoreboard players set #full_input itemio.math 0
scoreboard players operation #max_output_count itemio.io = @s itemio.servo.stack_limit

execute positioned ^ ^ ^-1 align xyz positioned ~.5 ~.5 ~.5 run function #itemio:calls/transfer
