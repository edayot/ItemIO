# Inserts the item of the helper entity in the container at ~ ~ ~
# #remaining itemio.math.input : the count not inserted yet

execute store result score #before itemio.math.input if items block ~ ~ ~ container.* *
execute as a97c9c67-fde0-4b89-926d-54fa4a866004 run loot insert ~ ~ ~ loot itemio:impl/internal/helper_item
execute store result score #inserted itemio.math.input if items block ~ ~ ~ container.* *
scoreboard players operation #inserted itemio.math.input -= #before itemio.math.input

execute if score #inserted itemio.math.input matches ..0 run return fail
scoreboard players set #success_input itemio.io 1
scoreboard players operation #remaining itemio.math.input -= #inserted itemio.math.input

# the helper keeps what's left (for the other half of a double chest)
item modify entity a97c9c67-fde0-4b89-926d-54fa4a866004 contents itemio:impl/internal/input/remaining_count
