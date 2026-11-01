# 📦 Containers

Basicly, a container is an entity at the position of a block.
To make a container compatible with IO, you need to specify a format that define what can be in a slot or not.

ItemIO don't care about the GUI protection by player interaction, it's up to you to handle it.

---

## Place/destroy function call

Somes function call must be made when placing or destroying a container, as the container entity.
- On place : ``function #itemio:calls/container/init``{l=mcfunction}
- On destroy : ``function #itemio:calls/container/destroy``{l=mcfunction} (before killing the entity)


## Config location

The config of a container is stored in the ``data`` field of the entity (every entity has one), at ``data.itemio`` :

- ``data.itemio.ioconfig`` : the [IOConfig](#ioconfig-data-structure)
- ``data.itemio.nbt_items_path`` : see [``itemio.container.nbt_items``](#itemiocontainernbt_items)

:::{admonition} Note
:class: note

All theses entity must have the ``itemio.container`` tag to be considered as a container.
The supported entities are markers, item frames, armor stands and item displays.
:::

:::{admonition} Legacy locations (before 2.0.0)
:class: seealso

When ``data.itemio.ioconfig`` doesn't exist, the config is read from the item of the entity :

- For item_frames : ``Item.components."minecraft:custom_data".itemio``
- For armor_stands : ``equipment.head.components."minecraft:custom_data".itemio``
- For item_display : ``item.components."minecraft:custom_data".itemio``

These locations are slower to read (the entity is read twice), prefer ``data.itemio``.
:::

## Tags

Theses tags are used to specify simple behaviour of the container.

### ``itemio.container.nope``
If you are using a container as a custom block but without the posibility of input/output items you can add the tag.
Nothing can be inserted or extracted, even if the block is a vanilla container.

### ``itemio.container.hopper`` 
Mark the custom container compatible with hoppers.

### ``itemio.container.not_vanilla_container``
By default, ItemIO disable all hoppers around the container, if you are not using a block with hopper capabilities, you can add this tag to disable the hopper protection.

## Advanced Tags

Tags here require an advanced understanding of ItemIO internal behaviour.

### ``itemio.container.auto_handled_io``
The container handles its inputs and outputs itself (see [Auto handled IO](#auto-handled-io)).

### ``itemio.container.hopper_protection_{offset}`` 
By default, ItemIO disable all hoppers around the container
You can add theses tags to disable the hopper protection

These tags are read when the container is initialised : add them before ``function #itemio:calls/container/init``.

#### Example
- ``itemio.container.hopper_protection_10`` will disable the hoppers in a 1 block shift around the container.
- ``itemio.container.hopper_protection_1`` will disable the hoppers in a 0.1 block shift around the container.

``offset`` must be between 1 and 20


### ``itemio.container.nbt_items``
This tag specify the stored location of the items in the container.
(default is in the container block)

The NBT path is stored in ``data.itemio.nbt_items_path``

#### Example
- ``block ~ ~ ~ Items`` is valid
- ``entity @s data.Inventory`` is valid
- ``entity @s data.complex_list[0]`` is not valid (it ends with a list)

#### Additional tags
- ``itemio.container.nbt_items.on_passengers`` When editing items, ItemIO will change the ``@s`` context to the passenger.
- ``itemio.container.nbt_items.on_vehicle`` When editing items, ItemIO will change the ``@s`` context to the vehicle.


## IOConfig Data Structure

IOConfig are dictionary that define what can be in a slot or not, they are dynamic and can be changed at any time.

```ts
[
    {
        Slot: int, // required
        mode: "input" | "output", // any other value is both
        allowed_side:{ // required
            north: 0b | 1b, south: 0b | 1b, east: 0b | 1b,
            west: 0b | 1b, top: 0b | 1b, bottom: 0b | 1b
        },
        filters: Filters // optional default to []
        // See filters section
        max_stack_size: int // optional default to 2147483647, 
        // Used to limit the stack size of a stackable item
    },
    (...)
]
```

The slots are tried in the order of the list.


:::{admonition} Full specification 
:class: seealso
<https://edayot.github.io/ItemIO/filters/index.html>
:::

:::{admonition} Ignored items
:class: seealso
All items matching ``<item>.components."minecraft:custom_data".itemio.gui: 1b``, will be ignored by ItemIO.
:::


## Auto handled IO

With the ``itemio.container.auto_handled_io`` tag, the container stores its items itself (in a storage, in the data of an entity...),
and ItemIO calls two function tags, executed as the container entity, at the center of the block.

### ``#itemio:event/auto_handled_input``

| Input Name                          | Input Type   | Input Source             | Input Objective/Path     |
| ---                                 | ---          | ---                      | ---                      |
| The item to insert                  | storage      | input                    | itemio:io                |
| The input side                      | storage      | input_side               | itemio:io                |

| Output Name                                             | Output Type  | Output Source            | Output Objective/Path    |
| ---                                                     | ---          | ---                      | ---                      |
| The count accepted by the container (0 before the call) | score        | #count_to_remove         | itemio.io                |

ItemIO computes everything else (``#success_input``, ``itemio:io output``), and puts the servos in cooldown when nothing is accepted.

```{code-block} mcfunction
:force:
# example:auto_handled_input (in #itemio:event/auto_handled_input)
execute 
    if entity @s[tag=example.my_block]
    if data storage itemio:io input{id:"minecraft:stone"}
    run function example:my_block/input:
        # accepts everything
        execute store result score #count example.math run data get storage itemio:io input.count
        # (...) add #count stone to the container
        scoreboard players operation #count_to_remove itemio.io = #count example.math
```

### ``#itemio:event/auto_handled_output``

The container offers its stacks with ``function #itemio:calls/offer``, until one is taken.
ItemIO checks the filters, the exact item and the max count of the output call, and moves the item to its destination during a transfer.

| Input Name (read only)                  | Input Type   | Input Source             | Input Objective/Path     |
| ---                                     | ---          | ---                      | ---                      |
| The filters of the output call          | storage      | filters                  | itemio:io                |
| The exact item of the output call       | storage      | input                    | itemio:io                |
| The output side                         | storage      | output_side              | itemio:io                |
| The maximum count                       | score        | #max_output_count        | itemio.io                |

`#itemio:calls/offer` :

| Input Name                                            | Input Type   | Input Source             | Input Objective/Path     |
| ---                                                   | ---          | ---                      | ---                      |
| The offered item, with the count available            | storage      | offer                    | itemio:io                |

| Output Name                                           | Output Type  | Output Source            | Output Objective/Path    |
| ---                                                   | ---          | ---                      | ---                      |
| Success : 1 if the item is taken, stop offering       | score        | #success_output          | itemio.io                |
| The count to remove from the container                | score        | #count_to_remove         | itemio.io                |
| The item taken                                        | storage      | output                   | itemio:io                |

```{code-block} mcfunction
:force:
# example:auto_handled_output (in #itemio:event/auto_handled_output)
execute 
    if entity @s[tag=example.my_block]
    run function example:my_block/output:
        data modify storage itemio:io offer set value {id:"minecraft:stone"}
        execute store result storage itemio:io offer.count int 1 run scoreboard players get @s example.stone_count
        function #itemio:calls/offer
        execute 
            if score #success_output itemio.io matches 1 
            run scoreboard players operation @s example.stone_count -= #count_to_remove itemio.io
        # else, offer the next stack (...)
```
