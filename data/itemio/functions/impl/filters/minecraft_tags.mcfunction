from beet import Context, Predicate
import json
import semver


def cache_tag_list(ctx: Context):
    """
    Cache the list of tags.
    """
    mc_versions = ctx.meta["mc_supports"]
    MC_VERSION = mc_versions[-1]
    URL = f"https://raw.githubusercontent.com/misode/mcmeta/{MC_VERSION}-registries/tag/item/data.json"
    cache = ctx.cache["itemio"]
    return cache.download(URL)

path = cache_tag_list(ctx)

with open(path) as f:
    tags = json.load(f)


execute 
    if score #filter.valid_item itemio.io matches 1 
    if data storage itemio:io filter.minecraft 
    as a97c9c67-fde0-4b89-926d-54fa4a866004 
    run function ~/_check_all:
        for tag in tags:
            function_name = "itemio:impl/filters/minecraft_tags/" + tag
            raw f"execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.minecraft.\"{tag}\" run function {function_name}"
            function function_name:
                scoreboard players set #filter.valid_item itemio.io 0
                data remove entity @s item
                data modify entity @s item set from storage itemio:io item
                execute if items entity @s container.0 f"#{tag}" run scoreboard players set #filter.valid_item itemio.io 1
