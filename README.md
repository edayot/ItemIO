# ItemIO <img src="https://github.com/edayot/ItemIO/blob/master/pack.png?raw=true" width="64" height="64">

A Minecraft Datapack library for handling items transportation and container declaration, such as for Simpledrawer or EnergyUtils. This library manages the following:
* Entity format for declaring custom containers based on vanilla ones.
* Cable system for transporting items between containers.
* Servo system for extracting and inserting items into containers.
* Custom filters handling for servos and more.
* Function call to output, input and transfer items between containers.

This is an embedded library, so you package it inside your datapack as opposed to having a separate download. Requires [LanternLoad](https://github.com/LanternMC/load) to operate.


## Scoreboards 📊
These are scoreboard objectives used to represent a value of some kind.

```
itemio.math, itemio.math.input, itemio.math.output
  Used for math, passing variables between functions, and storing a bit of data on a machine.
```

```
itemio.io
  Used to communicate with certains function calls.
```

```
itemio.network_id.low, itemio.network_id.high
  Used to store the network id of a cable/servo.
```

```
itemio.minecart_check
  Used to disable minecart around a container.
```

```
itemio.network.process_queue
  Used to divide the process of a network in multiple ticks.
```

```
itemio.servo.stack_limit
  Used to store the stack limit of a servo.
```

```
itemio.servo.cooldown
  Used to store the cooldown of a servo.
```

```
itemio.servo.retry_limit
  Used to store the retry limit of a servo.
```



## Entity Types 📦
These are tags (added throught the /tag command) that mark entities as being something, or as needing to do something.

### Containers 
Containers are vanilla or custom blocks. I will present the custom block system.

They are functions to call every time you do something with a container.

- On initialization : ``function #itemio:calls/container/init``
- On destroy : ``function #itemio:calls/container/destroy``


#### Tags

To declare a block as a container you need to add the tag ``itemio.container`` to the block. Additionally you can add these tags to the block:

- ``itemio.container.nope`` : If you are using a container as a custom block but without the posibility of input/output items you can add the tag.

- ``itemio.container.hopper`` : To make the container compatible with hoppers just add the tag. ItemIO will automatically handle the hoppers for you.

- ``itemio.container.not_vanilla_container`` : if the custom container does not use a vanilla container, this will tell ItemIO to not disable vanilla hoppers around the block.

- ``itemio.container.auto_handled_io`` : If you want to handle the input/output of the container by yourself (see SimpleDrawer)

#### NBT handling
Containers as to be configured depending on what entity you use you have to use theses NBT Paths:

- For makers : ``data.itemio.ioconfig``

- For item_frames : ``Item.tag.itemio.ioconfig``

- For armor_stands : ``ArmorItems[3].tag.itemio.ioconfig``

- For item_display : ``item.tag.itemio.ioconfig``

The ioconfig data are the same for all entities and they look like : 
```go
[
  {
    Slot:0b,
    mode:"input",
    allowed_side:{
      north:1b,south:1b,east:1b,west:1b,top:1b,bottom:1b
    }, 
    filters:[
      {
        id:["minecraft:stone","minecraft:dirt",(...)],
        energy:1b
      },
      {
        id:["minecraft:coal",""],
	ctc:[{id:"drawer",from:"airdox_:simpledrawer"}]
      }
    ]
  },
  (...)
]
```

Obligatory fields are marked with a ``*``

- *``Slot`` : The slot number of the container, you can declare multiple times a slot.

- ``mode`` : The allowed input/output mode of the slot can be ``input``, ``output`` or not declared (both).

- *``allowed_side`` : The allowed side for the slot, the value can be ``0b`` (not allowed) or ``1b`` (allowed).

- ``filters`` : The filter of the slot (can be custom or integrated), see below for more information.


#### Filters

Filters are called when itemio is trying input/output items from a container. 
It's a list of __filter__  like this : 
```go
filters:[
  {
    id:["minecraft:stone","minecraft:dirt",(...)],
    energy:1b
  },
  {
    id:["minecraft:coal","],
  }
]
```
Each filter in the list is ORed with the others, in each filter the fields are ANDed.

For example here the filter will allow ``minecraft:stone`` or ``minecraft:dirt`` with a ``energy`` tag set to 1b OR ``minecraft:coal``.

The filter can be customized (see function calls)


### Cables

Cables are custom blocks that handle a cable system between all devices of the same network.

They are functions to call every time you do something with a cable.

- On initialization : ``function #itemio:calls/cables/init``
- On destroy : ``function #itemio:calls/cables/destroy``

They are also a function tag to call when a cable is updated : 

``function #itemio:event/cable_update``


Cables' itemio.math value is a binary encoded number indicating which sides are connected, ie:

```
    63 -> 1  1  1  1  1  1 -> all sides are active
	  32 16 8  4  2  1
          E  W  S  N  U  D
    This can be used to update the model of the cable.
```

### Servos

Servos are custom block parts of a network that can input/output items from/to containers.

They are functions to call every time you do something with a servo.

- On initialization : ``function #itemio:calls/servos/init``
- On destroy : ``function #itemio:calls/servos/destroy``

They are also a function tag to call when a servo is updated : 

``function #itemio:event/network_update``

Servos' itemio.math value is a boolean indicating if the servo is connected to a network or not.

1 -> connected
0 -> not connected

#### NBT handling
Servos has their own config at the NBT Path : ``data.itemio.ioconfig.filters``

The filters are the same as the containers' filters and work the same way.



## Function Calls 📞
Function calls are called by you to trigger certain events or features.

```mcfunction
function #itemio:calls/input
```
To call on a container to input items into the container

__Inputs__:
  - The position of the command execution
  - ``storage itemio:io input`` : The item to input
  - ``storage itemio:io input_side`` : The side to input from can be :
      ``"north","south","east","west","top","bottom","wireless"`` (wireless bypass the side check)

__Outputs__:
  - ``storage itemio:io output`` : The item that could not be input
  - ``score itemio.io #success_input`` : Set to 1 if the input was successful, 0 otherwise
  - ``score itemio.io #count_to_remove`` : The number of item that could not be input
  You can use this item modifier to remove the necessary amount of item : 

  ```json
  [
    {
        "function": "minecraft:set_count",
        "count": {
            "type": "minecraft:score",
            "target": {
                "type": "minecraft:fixed",
                "name": "#count_to_remove"
            },
            "score": "itemio.io",
            "scale": -1
        },
        "add": true
    }
]
```

```mcfunction
function #itemio:calls/output
```
To call on a container to output items from the container.

__Inputs__:

  - The position of the command execution
  - ``score #max_output_count itemio.math.output`` : The maximum number of item to output
  - ``storage itemio:io output_side`` : The side to output to can be :
      ``"north","south","east","west","top","bottom","wireless"`` (wireless bypass the side check)
  - ``storage itemio:io input`` : If declared, the item will do an NBT check before outputting
  - ``storage itemio:io filters`` : If declared, the item will do a filter check before outputting (see above)

__Outputs__:
  - ``storage itemio:io output`` : The item outputted from the container
  - ``score #success_output itemio.io`` : Set to 1 if the output was successful, 0 otherwise


```mcfunction
function #itemio:calls/transfer
```
To call on a container to transfer items from the container to another container.

__Inputs__:
  - All the inputs of ``#itemio:calls/output``
  - The position of the command execution (the extracting container)
  - Entities marker with ``itemio.transfer.destination`` : Emplacement of one or more destination container
    All destination have : 
    - ``data.itemio.input_side`` : Same as above
    - ``data.itemio.ioconfig.filters`` : Same as above
    - ``data.itemio.ioconfig.inputs`` : NBT match of multiple items (ORed)

__Outputs__:
  - ``#success_transfer itemio.io`` : Set to 1 if the transfer was successful, 0 otherwise


```mcfunction
function #itemio:calls/try_input_after
```
Used internally to try to input items after output.

```mcfunction
function #itemio:calls/filters_v2
```
Used internally to apply filter items.

__Inputs__:
  - ``storage itemio:io item`` : The item to filter
  - ``storage itemio:io filters`` : The filters to apply

__Outputs__:
  - ``score #filters.valid_item itemio.io`` : Set to 1 if the item is valid, 0 otherwise (see above)


```mcfunction
function #itemio:calls/disable_servo
```
Used internally to disable a servo.

```mcfunction
function #itemio:calls/auto_handled_output
```
As to be used in ``#itemio:event/auto_handled_output`` (see below)
  
## Function Event 📞

```mcfunction
function #itemio:event/auto_handled_output
function #itemio:event/auto_handled_input
```
Used when dealing with special containers (like in SimpleDrawer)

```mcfunction
function #itemio:event/network_update
```
Used when a network element is updated (see above)

```mcfunction
function #itemio:event/cable_update
```
Used when a cable is updated (see above)


```mcfunction
function #itemio:event/filter_v2
```
Used to add a custom filter, implement your own syntax here. (see internal function as a example)



## How to use
1. Install [LanternLoad](https://github.com/LanternMC/load) in your datapack
2. Copy the `data/itemio` folder into your data pack
3. Merge the contents of `ItemIO/data/load/tags/functions/load.json` and your own `data/load/tags/functions/load.json`
4. Implement the API as described above.

## Contributing
Contributions are always welcome! The datapack is compiled using the [beet](https://mcbeet.dev) .

```bash
$ git clone https://github.com/edayot/ItemIO.git
$ cd ItemIO

$ beet -p beet-release.yaml
```
