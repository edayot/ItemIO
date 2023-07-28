# Containers

Basicly, a container is an entity at the position of a block.
To make a container compatible with IO, you need to specify a format that define what can be in a slot or not.

ItemIO don't care about the GUI protection by player interaction, it's up to you to handle it.

---

## Place/destroy function call

Somes function call must be made when placing or destroying a container.
- On place : ``function #itemio:calls/container/init``
- On destroy : ``function #itemio:calls/container/destroy``


## Available Entity
Containers as to be configured depending on what entity you use you have to use theses NBT Paths:

- For makers : ``data.itemio.ioconfig``

- For item_frames : ``Item.tag.itemio.ioconfig``

- For armor_stands : ``ArmorItems[3].tag.itemio.ioconfig``

- For item_display : ``item.tag.itemio.ioconfig``


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



