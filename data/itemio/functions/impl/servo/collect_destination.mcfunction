# Executed as an insert servo : adds its destination to storage itemio:main servo.destinations

data modify storage itemio:main servo.insert set value {}
data modify storage itemio:main servo.insert merge from entity @s data.itemio
execute
    unless data storage itemio:main servo.insert.target
    at @s run function itemio:impl/servo/compute_target
execute
    unless data storage itemio:main servo.insert.target
    run data modify storage itemio:main servo.insert.target set from storage itemio:main servo.target

# An insert servo of the source block is not a destination
data modify storage itemio:main servo.block set from storage itemio:main servo.insert.target
data remove storage itemio:main servo.block.side
execute store success score #other_block itemio.math run data modify storage itemio:main servo.block set from storage itemio:main servo.source
execute if score #other_block itemio.math matches 0 run return fail

data modify storage itemio:main servo.entry set from storage itemio:main servo.insert.target
data modify storage itemio:main servo.entry.input_side set from storage itemio:main servo.insert.target.side
data remove storage itemio:main servo.entry.side

# The config is data.itemio.ioconfig, or in the item of the servo (before 2.0.0)
execute
    unless data storage itemio:main servo.insert.ioconfig
    run data modify storage itemio:main servo.insert.ioconfig set from entity @s Item.components."minecraft:custom_data".itemio.ioconfig
data modify storage itemio:main servo.entry.filters set from storage itemio:main servo.insert.ioconfig.filters
data modify storage itemio:main servo.entry.items set from storage itemio:main servo.insert.ioconfig.items
execute store result storage itemio:main servo.entry.stack_limit int 1 run scoreboard players get @s itemio.servo.stack_limit

data modify storage itemio:main servo.destinations append from storage itemio:main servo.entry
