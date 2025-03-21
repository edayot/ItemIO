


data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 equipment.mainhand set value {}
data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 equipment.mainhand set from storage itemio:io input

execute unless items entity 93682a08-d099-4e8f-a4a6-1e33a3692301 weapon.mainhand *[minecraft:jukebox_playable] run return fail


data remove storage itemio:main.input ItemUnique
data modify storage itemio:main.input ItemUnique set from block ~ ~ ~ RecordItem

scoreboard players set #override_stack_size itemio.math.input 1
function itemio:impl/container/input/vanilla_custom/single_item/main
scoreboard players set #override_stack_size itemio.math.input 0

execute 
    if score #success_input itemio.io matches 1 
    if data storage itemio:main.input ItemUnique.components
    run function ~/loot_item_components with storage itemio:main.input ItemUnique
execute 
    if score #success_input itemio.io matches 1 
    unless data storage itemio:main.input ItemUnique.components
    run function ~/loot_item with storage itemio:main.input ItemUnique

function ~/loot_item:
    $loot replace block ~ ~ ~ contents loot { \
        "pools": [ \
            { \
                "rolls": 1, \
                "entries": [ \
                    { \
                        "type": "minecraft:item", \
                        "name": "$(id)", \
                    } \
                ] \
            } \
        ] \
    }


function ~/loot_item_components:
    $loot replace block ~ ~ ~ contents loot { \
        "pools": [ \
            { \
                "rolls": 1, \
                "entries": [ \
                    { \
                        "type": "minecraft:item", \
                        "name": "$(id)", \
                        "functions": [ \
                            { \
                                "function": "minecraft:set_components", \
                                "components": $(components) \
                            } \
                        ] \
                    } \
                ] \
            } \
        ] \
    }

