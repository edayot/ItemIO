# Inserts storage itemio:io input in the vanilla container at ~ ~ ~
# Same algorithm as /loot insert : the stacks already in the container are filled first,
# then the first empty slots. The right half of a double chest is filled first.
# Used entity : a97c9c67-fde0-4b89-926d-54fa4a866004 (holds the inserted item)

execute unless data storage itemio:io input run return fail

execute store result score #count_input itemio.math.input run data get storage itemio:io input.count
scoreboard players operation #remaining itemio.math.input = #count_input itemio.math.input

# a disabled hopper doesn't accept items
execute if block ~ ~ ~ hopper[enabled=false] run return run function itemio:impl/container/input/vanilla/result

data modify entity a97c9c67-fde0-4b89-926d-54fa4a866004 item set from storage itemio:io input

# a shulker box doesn't accept shulker boxes
execute if block ~ ~ ~ #shulker_boxes if items entity a97c9c67-fde0-4b89-926d-54fa4a866004 contents #itemio:shulker_boxes run return run function itemio:impl/container/input/vanilla/result

execute if block ~ ~ ~ #itemio:container/chests[type=left] run return run function itemio:impl/container/input/vanilla/double_chest_left
execute if block ~ ~ ~ #itemio:container/chests[type=right] run return run function itemio:impl/container/input/vanilla/double_chest_right

function itemio:impl/container/input/vanilla/insert
function itemio:impl/container/input/vanilla/result
