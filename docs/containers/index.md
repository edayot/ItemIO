# 📦 Containers

Basicly, a container is an entity at the position of a block.
To make a container compatible with IO, you need to specify a format that define what can be in a slot or not.

ItemIO don't care about the GUI protection by player interaction, it's up to you to handle it.

---

## Place/destroy function call

Somes function call must be made when placing or destroying a container.
- On place : ``function #itemio:calls/container/init``{l=mcfunction}
- On destroy : ``function #itemio:calls/container/destroy``{l=mcfunction}


## Available Entity
Containers as to be configured depending on what entity you use you have to use theses NBT Paths:

- For makers : ``data.itemio.ioconfig``

- For item_frames : ``Item.components."minecraft:custom_data".itemio.ioconfig``

- For armor_stands : ``ArmorItems[3].components."minecraft:custom_data".itemio.ioconfig``

- For item_display : ``item.components."minecraft:custom_data".itemio.ioconfig``

:::{admonition} Note
:class: note

All theses entity must have the ``itemio.container`` tag to be considered as a container.
:::

## Tags

Theses tags are used to specify simple behaviour of the container.

### ``itemio.container.nope``
If you are using a container as a custom block but without the posibility of input/output items you can add the tag.

### ``itemio.container.hopper`` 
Mark the custom container compatible with hoppers.

### ``itemio.container.not_vanilla_container``
By default, ItemIO disable all hoppers around the container, if you are not using a block with hopper capabilities, you can add this tag to disable the hopper protection.

## Advanced Tags

Tags here require an advanced understanding of ItemIO internal behaviour.

### ``itemio.container.auto_handled_io``
If you want to handle the input/output of the container by yourself (see SimpleDrawer)

### ``itemio.container.hopper_protection_{offset}`` 
By default, ItemIO disable all hoppers around the container
You can add theses tags to disable the hopper protection

#### Example
- ``itemio.container.hopper_protection_10`` will disable the hoppers in a 1 block shift around the container.
- ``itemio.container.hopper_protection_1`` will disable the hoppers in a 0.1 block shift around the container.

``offset`` must be between 1 and 20

### ``itemio.container.ioconfig_from_storage`` :
Specify that the container will use a storage based ioconfig. Use the itemio.ioconfig_from_storage NBT path to specify the storage.


### ``itemio.container.nbt_items``
This tag specify the stored location of the items in the container.
(default is in the container block)

The NBT path is stored in ``itemio.nbt_items_path``

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


:::{admonition} Full specification 
:class: seealso
<https://edayot.github.io/ItemIO/filters/index.html>
:::

:::{admonition} Ignored items
:class: seealso
All items matching ``<item>.components."minecraft:custom_data".itemio.gui: 1b``, will be ignored by ItemIO.
:::




