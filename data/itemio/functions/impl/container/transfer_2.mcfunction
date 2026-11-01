

scoreboard players add #max_output_count itemio.io 0

# The destinations, nearest first
data modify storage itemio:main transfer.destinations set value []
execute if data storage itemio:io destinations run data modify storage itemio:main transfer.destinations set from storage itemio:io destinations
execute
    unless data storage itemio:io destinations
    align xyz positioned ~.5 ~.5 ~.5
    as @e[tag=itemio.transfer.destination,sort=nearest]
    unless entity @s[distance=..0.5001]
    run function itemio:impl/container/transfer/collect_marker:
        data modify storage itemio:main transfer.marker set from entity @s
        data modify storage itemio:main transfer.entry set value {}
        data modify storage itemio:main transfer.entry merge from storage itemio:main transfer.marker.data.itemio.ioconfig
        data modify storage itemio:main transfer.entry.input_side set from storage itemio:main transfer.marker.data.itemio.input_side
        data modify storage itemio:main transfer.entry.x set from storage itemio:main transfer.marker.Pos[0]
        data modify storage itemio:main transfer.entry.y set from storage itemio:main transfer.marker.Pos[1]
        data modify storage itemio:main transfer.entry.z set from storage itemio:main transfer.marker.Pos[2]
        execute
            if score @s itemio.servo.stack_limit = @s itemio.servo.stack_limit
            store result storage itemio:main transfer.entry.stack_limit int 1
            run scoreboard players get @s itemio.servo.stack_limit
        data modify storage itemio:main transfer.destinations append from storage itemio:main transfer.entry
execute unless data storage itemio:main transfer.destinations[0] run return fail

scoreboard players set #try_input_after itemio.math.output 1
function itemio:impl/container/output/repart
scoreboard players set #try_input_after itemio.math.output 0
