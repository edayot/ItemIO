# 📚 Basic Usage




## Prerequisites

- What is a [datapack](https://minecraft.fandom.com/wiki/Data_Pack)
- What is a [function tag](https://minecraft.fandom.com/wiki/Function_(Java_Edition)#Invocation_from_function_tags)
- The `.mcfunction` syntax is the same as [Smithed](https://wiki.smithed.dev/libraries) syntax
- Knowing how to place a custom block, consider using [Smithed Custom Block](https://wiki.smithed.dev/libraries/custom-block/)



## Installation

1. Install [LanternLoad](https://github.com/LanternMC/load) in your datapack
2. Copy the `data/itemio` folder into your data pack
3. Merge the contents of `ItemIO/data/load/tags/functions/load.json` and your own `data/load/tags/functions/load.json`

## Adding your first container !

Add a simple container that only accept dirt in the first slot, but only from bottom :

```{code-block} mcfunction
:force:
# example:my_block/place

setblock ~ ~ ~ barrel

execute 
    summon item_display
    run function example:my_block/place_entity:
        # Define the ioconfig
        data modify entity @s item.tag.itemio.ioconfig set value []
        data modify entity @s item.tag.itemio.ioconfig append value {
            Slot:0b,
            mode: "input",
            allowed_side:{bottom:1b},
            filters:[
                {id:["minecraft:dirt"]}
            ]
        }
        tag @s add itemio.container # The required tag
        tag @s add itemio.container.hopper # To make it work with hoppers
        function #itemio:calls/container/init
```


:::{admonition} Full specification 
:class: seealso
<https://edayot.github.io/ItemIO/containers/index.html>
:::

It's simple, you just need to define the ioconfig and add the required tags and boom, you have a container that can be used with hoppers.
