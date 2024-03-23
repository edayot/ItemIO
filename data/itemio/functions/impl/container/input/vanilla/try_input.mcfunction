data remove storage itemio:main.input Items
data modify storage itemio:main.input Items set from block ~ ~ ~ Items
data remove storage itemio:main.input Items[{components:{"minecraft:custom_data":{itemio:{gui:1b}}}}]

data remove storage itemio:main.input input
data modify storage itemio:main.input input set from storage itemio:io input


execute store result score #block_stack itemio.math.input if data storage itemio:main.input Items[]

scoreboard players set #full_stack itemio.math.input 64

data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0] set from storage itemio:main.input input
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 store result score #stack_size itemio.math.input run function itemio:impl/utils/get_stack_size

execute if score #crafter_input itemio.math.input matches 1 run scoreboard players set #full_stack itemio.math.input 1


execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.count


scoreboard players operation #needed_stack itemio.math.input = #count_input itemio.math.input
scoreboard players operation #needed_stack itemio.math.input /= #full_stack itemio.math.input
scoreboard players add #needed_stack itemio.math.input 1
scoreboard players operation #needed_stack itemio.math.input += #block_stack itemio.math.input


# block_stack : the number of occupied slots in the block
# block_size : the number of slots available in the block

# count_input : the number of items in the input
# full_stack : the number of items in a full stack

# needed_stack : the number of slot needed to store the input into the block plus the number of occupied slots in the block


# test the condition if we can use a loot table on the block
# if #needed_stack <= #block_size then we can use a loot table
# else we loop over all the slots in the block and try to find a slot with the same item
execute 
    if score #crafter_input itemio.math.input matches 0 
    if score #needed_stack itemio.math.input <= #block_size itemio.math.input run 
    function itemio:impl/container/input/vanilla/inf_insert
execute 
    if score #crafter_input itemio.math.input matches 0 
    if score #needed_stack itemio.math.input > #block_size itemio.math.input run 
    function itemio:impl/container/input/vanilla/sup_insert

execute 
    if score #crafter_input itemio.math.input matches 1
    function itemio:impl/container/input/vanilla/sup_insert



