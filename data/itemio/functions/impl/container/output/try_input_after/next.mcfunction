
# queue[0] : the next destination
data modify storage itemio:main transfer.current set from storage itemio:main transfer.queue[0]
data remove storage itemio:main transfer.queue[0]

# The filters of the destination, else its list of exact items
scoreboard players set #valid_destination itemio.math 1
execute
    if data storage itemio:main transfer.current.filters[0]
    run function ~/check_filters:
        data remove storage itemio:io filters
        data modify storage itemio:io filters set from storage itemio:main transfer.current.filters
        data remove storage itemio:io item
        data modify storage itemio:io item set from storage itemio:io output
        function itemio:impl/filters/calls/main
        scoreboard players operation #valid_destination itemio.math = #filters.valid_item itemio.io
execute
    unless data storage itemio:main transfer.current.filters[0]
    if data storage itemio:main transfer.current.items[0]
    run function ~/check_items:
        scoreboard players set #valid_destination itemio.math 0
        data modify storage itemio:main transfer.items set from storage itemio:main transfer.current.items
        function itemio:impl/container/output/try_input_after/check_items

        function itemio:impl/container/output/try_input_after/check_items:
            data remove storage itemio:main Item1
            data remove storage itemio:main Item2
            data modify storage itemio:main Item1 set from storage itemio:io output
            data modify storage itemio:main Item2 set from storage itemio:main transfer.items[0]
            data remove storage itemio:main Item1.Slot
            data remove storage itemio:main Item2.Slot
            data remove storage itemio:main Item1.count
            data remove storage itemio:main Item2.count

            execute store result score #!same_item itemio.math run data modify storage itemio:main Item1 set from storage itemio:main Item2
            execute if score #!same_item itemio.math matches 0 run return run scoreboard players set #valid_destination itemio.math 1
            data remove storage itemio:main transfer.items[0]
            execute if data storage itemio:main transfer.items[0] run function itemio:impl/container/output/try_input_after/check_items

execute if score #valid_destination itemio.math matches 1 if data storage itemio:main transfer.current.dx run function ~/relative with storage itemio:main transfer.current
execute if score #valid_destination itemio.math matches 1 unless data storage itemio:main transfer.current.dx run function ~/absolute with storage itemio:main transfer.current

function ~/relative:
    $execute positioned ~$(dx) ~$(dy) ~$(dz) run function itemio:impl/container/output/try_input_after/input
function ~/absolute:
    $execute positioned $(x) $(y) $(z) run function itemio:impl/container/output/try_input_after/input

execute if score #success_input itemio.io matches 0 if data storage itemio:main transfer.queue[0] run function itemio:impl/container/output/try_input_after/next
