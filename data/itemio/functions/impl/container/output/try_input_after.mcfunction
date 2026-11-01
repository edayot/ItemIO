# @public
# Tries to input storage itemio:io output in the destinations of the current transfer
# (storage itemio:main transfer.destinations, nearest first)
# Outputs :
#   score #success_input itemio.io
#   score #remove_count itemio.math.output : the count to remove from the origin
# tellraw @p [{"text":"try input after : "},{"nbt":"output","storage":"itemio:io"}]
scoreboard players set #success_input itemio.io 0

data remove storage itemio:main temp.seen_item
data modify storage itemio:main temp.seen_item set from storage itemio:io output
data remove storage itemio:main temp.seen_item.count
data remove storage itemio:main temp.seen_item.Slot

data remove storage itemio:main temp.seen_items_loop
data modify storage itemio:main temp.seen_items_loop set from storage itemio:main.output seen_items


# Test if the seen_item is in the list of already seen items
scoreboard players set #already_seen itemio.math 0
execute
    if data storage itemio:main temp.seen_items_loop[0]
    run function itemio:impl/container/output/try_input_after/seen_loop:
        scoreboard players set #valid_item itemio.math 0
        execute
            store result score #!same_item itemio.math
            run data modify storage itemio:main temp.seen_items_loop[0] set from storage itemio:main temp.seen_item
        execute
            if score #!same_item itemio.math matches 0
            run return run scoreboard players set #already_seen itemio.math 1
        data remove storage itemio:main temp.seen_items_loop[0]
        execute
            if data storage itemio:main temp.seen_items_loop[0]
            run function itemio:impl/container/output/try_input_after/seen_loop

execute
    if score #already_seen itemio.math matches 1
    run return run scoreboard players set #remove_count itemio.math.output 0


data modify storage itemio:main transfer.queue set from storage itemio:main transfer.destinations
execute if data storage itemio:main transfer.queue[0] run function itemio:impl/container/output/try_input_after/next


execute if score #success_input itemio.io matches 1 run scoreboard players operation #remove_count itemio.math.output = #count_to_remove itemio.io
execute
    if score #success_input itemio.io matches 0
    run function ~/add_to_seen_items:
        scoreboard players set #remove_count itemio.math.output 0
        data modify storage itemio:main.output seen_items append from storage itemio:main temp.seen_item



execute if score #servos_transfer itemio.math matches 1 if score #success_input itemio.io matches 0 run function itemio:impl/container/input/disable_servo
