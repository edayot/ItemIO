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

- For item_frames : ``Item.tag.itemio.ioconfig``

- For armor_stands : ``ArmorItems[3].tag.itemio.ioconfig``

- For item_display : ``item.tag.itemio.ioconfig``

## Tags

To declare a block as a container you need to add the tag ``itemio.container`` to the block. Additionally you can add these tags to the block:

- ``itemio.container.nope`` : If you are using a container as a custom block but without the posibility of input/output items you can add the tag.

- ``itemio.container.hopper`` : To make the container compatible with hoppers just add the tag. ItemIO will automatically handle the hoppers for you.

- ``itemio.container.not_vanilla_container`` : if the custom container does not use a vanilla container, this will tell ItemIO to not disable vanilla hoppers around the block.

- ``itemio.container.auto_handled_io`` : If you want to handle the input/output of the container by yourself (see SimpleDrawer)

- ``itemio.container.nbt_items`` : If you want a custom NBT path search for items. Like in a other block entity, or in the entity itself.
    - Store this information in itemio.nbt_items_path as a string.
    - The string is a data location like "block ~ ~ ~ Items" (default behavior).
    - The data location must ends with letters, example: 
        - "block ~ ~ ~ Items" is valid
        - "entity ~ ~ ~ data.complex_list[0]" is not valid, even if it's a list of items.
- ``itemio.container.nbt_items.on_passenger`` : 
    - Require ``itemio.container.nbt_items``. 
    - Indicate if the NBT path is on the passenger of the entity.
    - Can be used to make minecart compatible with IO.
- ``itemio.container.nbt_items.on_vehicle`` :
    - Same as above but for the vehicle of the entity.


## IOConfig Data Structure

IOConfig are dictionary that define what can be in a slot or not, they are dynamic and can be changed at any time.

```ts
[
    {
        Slot: int, // required
        mode: "input" | "output", // any other value is both
        allowed_side:{ // required
            north: 0b | 1b, south: 0b | 1b, east: 0b | 1b, west: 0b | 1b, up: 0b | 1b, down: 0b | 1b
        },
        filters: Filters // optional see filters section
    }
]
```


:::{admonition} Full specification 
:class: seealso
<https://edayot.github.io/ItemIO/filters/index.html>
:::

:::{admonition} Ignored items
:class: seealso
All items matching ``<item>.tag.itemio.gui: 1b``, will be ignored by ItemIO.
:::


## Storage based ioconfig

:::{warning} Warning
:class: seealso
This is a very advanced feature, you should not use it unless you know what you are doing.
:::



Storage based ioconfig are ioconfig that are stored in a storage, they are dynamic and can be changed at any time for all containers that use it.

To use a storage based ioconfig you need to add the tag ``itemio.container.ioconfig_from_storage`` to the entity.

```ts
{
    storage: string // a storage location example: "namespace:storage my_container.ioconfig"
}
```


