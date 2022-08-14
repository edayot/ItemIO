#Try to input a item in a container
# Inputs :
#   A item in storage itemio:io input
#   A input side in storage itemio:io input_side
#       - Can be "north","south","east","west","top","bottom"
# Outputs
#   A item NBT of what's left that can"t be in the container
#   A score #count_to_remove itemio.math.input to know how many items as to be remove from the origin
#       The item modifier itemio:input/remove_count_origin can be use to remove the good amont of item
#define storage itemio:io
#define storage itemio:main.input

scoreboard players set #success_input itemio.math.input 0

execute align xyz positioned ~.5 ~.5 ~.5 run tag @e[type=#itemio:container,tag=itemio.container,distance=..0.5,limit=1,sort=nearest] add itemio.selected
execute as @e[tag=itemio.selected,tag=!itemio.container.nope] run function itemio:container/input/custom/input
execute unless entity @e[tag=itemio.selected,tag=!itemio.container.nope] if block ~ ~ ~ #itemio:container run function itemio:container/input/vanilla/input
tag @e[tag=itemio.selected] remove itemio.selected

