# @public
# Offers an item of an auto handled container, during #itemio:event/auto_handled_output

# Inputs :
#   storage itemio:io offer : the item, with the count available in the container

# Outputs :
#   score #success_output itemio.io : 1 if the item is taken (stop offering)
#   score #count_to_remove itemio.io : the count to remove from the container
#   storage itemio:io output : the item taken

scoreboard players set #success_output itemio.io 0
scoreboard players set #count_to_remove itemio.io 0

scoreboard players set #offer_valid itemio.math.output 1
execute
    if score #auto_filters itemio.math.output matches 1
    run function itemio:impl/container/output/offer/check_filters:
        data remove storage itemio:io filters
        data modify storage itemio:io filters set from storage itemio:main.output auto.filters
        data remove storage itemio:io item
        data modify storage itemio:io item set from storage itemio:io offer
        function itemio:impl/filters/calls/main
        scoreboard players operation #offer_valid itemio.math.output = #filters.valid_item itemio.io
execute
    if score #auto_filters itemio.math.output matches 0
    if score #auto_input itemio.math.output matches 1
    run function itemio:impl/container/output/offer/check_input:
        data remove storage itemio:main.output Item1
        data remove storage itemio:main.output Item2
        data modify storage itemio:main.output Item1 set from storage itemio:main.output auto.input
        data modify storage itemio:main.output Item2 set from storage itemio:io offer
        data remove storage itemio:main.output Item1.count
        data remove storage itemio:main.output Item1.Slot
        data remove storage itemio:main.output Item2.count
        data remove storage itemio:main.output Item2.Slot
        execute store result score #!same_item itemio.math.output run data modify storage itemio:main.output Item1 set from storage itemio:main.output Item2
        execute unless score #!same_item itemio.math.output matches 0 run scoreboard players set #offer_valid itemio.math.output 0

execute
    if score #offer_valid itemio.math.output matches 1
    run function itemio:impl/container/output/offer/output:
        scoreboard players set #success_output itemio.io 1
        data modify storage itemio:io output set from storage itemio:io offer
        execute store result score #test_count_output itemio.math.output run data get storage itemio:io output.count
        execute if score #test_count_output itemio.math.output > #max_output_count itemio.io store result storage itemio:io output.count int 1 run scoreboard players get #max_output_count itemio.io

        execute store result score #remove_count itemio.math.output run data get storage itemio:io output.count
        execute if score #try_input_after itemio.math.output matches 1 run function itemio:impl/container/output/try_input_after
        execute if score #remove_count itemio.math.output matches ..0 run scoreboard players set #success_output itemio.io 0
        scoreboard players operation #count_to_remove itemio.io = #remove_count itemio.math.output

# The context of the output call is restored for the next offer
data remove storage itemio:io input
data modify storage itemio:io input set from storage itemio:main.output auto.input
data remove storage itemio:io filters
data modify storage itemio:io filters set from storage itemio:main.output auto.filters
