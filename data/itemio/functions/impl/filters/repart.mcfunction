# @public
# These are example of integrated filter
# Remember : Do not modify any of the input data 

# Inputs :
# storage itemio:io filter
# storage itemio:io item

# Outputs :
# score #filter.valid_item itemio.math
# The score is 1 if the item is valid and act as an AND gate for all the filters

from beet import Context, Predicate
import json


def cache_tag_list(ctx: Context):
    """
    Cache the list of tags.
    """
    MC_VERSION = ctx.minecraft_version
    URL = f"https://raw.githubusercontent.com/misode/mcmeta/{MC_VERSION}-registries/tag/item/data.json"
    cache = ctx.cache["itemio"]
    return cache.download(URL)

path = cache_tag_list(ctx)

with open(path) as f:
    tags = json.load(f)




execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.energy run function itemio:impl/filters/energy
execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.id run function itemio:impl/filters/id
execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.ctc run function itemio:impl/filters/ctc
execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.smithed.id run function itemio:impl/filters/smithed_id
execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.merge as 93682a08-d099-4e8f-a4a6-1e33a3692301 run function itemio:impl/filters/merge
execute 
    if score #filter.valid_item itemio.io matches 1 
    if data storage itemio:io filter.minecraft as 93682a08-d099-4e8f-a4a6-1e33a3692301 
    run function itemio:impl/filters/minecraft:
        for tag in tags:
            function_name = "itemio:impl/filters/minecraft/" + tag
            raw f"execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.minecraft.{tag} run function {function_name}"
            function function_name:
                scoreboard players set #filter.valid_item itemio.io 0
                data modify entity @s HandItems[0] set value {id:"minecraft:air"}
                data modify entity @s HandItems[0] set from storage itemio:io item
                raw f"execute if predicate itemio:impl/minecraft/{tag} run scoreboard players set #filter.valid_item itemio.io 1"
            
            predicate_tag = {
                "condition": "minecraft:entity_properties",
                "entity": "this",
                "predicate": {
                    "equipment": {
                        "mainhand": {
                            "tag": f"minecraft:{tag}"
                        }
                    }
                }
            }
            ctx.data.predicates[f"itemio:impl/minecraft/{tag}"] = Predicate(predicate_tag)


#tellraw @a {"score":{"name":"#filter.valid_item","objective":"itemio.io"}}
