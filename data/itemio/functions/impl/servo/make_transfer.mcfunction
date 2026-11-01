# Executed as and at an extract servo of the network being processed

scoreboard players add #servos_in_tick itemio.math 1

data modify storage itemio:main servo.extract set value {}
data modify storage itemio:main servo.extract merge from entity @s data.itemio
execute
    unless data storage itemio:main servo.extract.target
    run function itemio:impl/servo/compute_target
execute
    unless data storage itemio:main servo.extract.target
    run data modify storage itemio:main servo.extract.target set from storage itemio:main servo.target

data modify storage itemio:io output_side set from storage itemio:main servo.extract.target.side

# The config is data.itemio.ioconfig, or in the item of the servo (before 2.0.0)
execute
    unless data storage itemio:main servo.extract.ioconfig
    run data modify storage itemio:main servo.extract.ioconfig set from entity @s Item.components."minecraft:custom_data".itemio.ioconfig

data remove storage itemio:main servo_filters
data remove storage itemio:main servo_items


data modify storage itemio:main servo_filters set from storage itemio:main servo.extract.ioconfig.filters
data modify storage itemio:main servo_items set from storage itemio:main servo.extract.ioconfig.items

execute store result score #if_items_defined itemio.math if data storage itemio:main servo_items[0]


# The destinations : the insert servos of the network, nearest to the source first
data modify storage itemio:main servo.source set from storage itemio:main servo.extract.target
data remove storage itemio:main servo.source.side
data modify storage itemio:main servo.destinations set value []
execute
    positioned ^ ^ ^-1 align xyz positioned ~.5 ~.5 ~.5
    as @e[type=#itemio:servos,tag=itemio.servo.same_network,tag=itemio.servo.insert,sort=nearest]
    if score @s itemio.servo.cooldown < #global_tick itemio.math
    run function itemio:impl/servo/collect_destination
execute unless data storage itemio:main servo.destinations[0] run return fail

scoreboard players set #nb_retry itemio.math 1
scoreboard players operation #nb_retry itemio.math = @s itemio.servo.retry_limit
execute unless score #nb_retry itemio.math matches 1.. run scoreboard players set #nb_retry itemio.math 1

function itemio:impl/servo/make_transfer_loop
