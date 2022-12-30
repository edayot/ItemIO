# ItemIO

## Introduction

A library for interacting items inside custom and vanilla containers and between datapacks.

With integrated feature like servo management and cable management.

I recommend to see theses datapacks that use ItemIO to understand how it works:
- [EnergyUtils](https://github.com/edayot/EnergyUtils)
- [SimpleDrawer](https://github.com/edayot/SimpleDrawer)



## Features

### - Containers
All item frames, marker and armor_stand can be declared as custom container with the tag ``itemio.container``

Also you need to execute as the container on placement ``function #itemio:calls/container/init``

You can configure the input/output feature in their entity data, the path is :

- For makers : ``data.itemio.ioconfig``
- For item_frames : ``Item.tag.itemio.ioconfig``
- For armor_stands : ``ArmorItems[3].tag.itemio.ioconfig``

The ioconfig data are the same for all entities and they look like : 
```
[
	{
		Slot:<The slot number of the container>,
		mode:<"input" or "output" if not declared is the two>,
		allowed_side:{
			north:1b,south:1b,east:1b,west:1b,top:1b,bottom:1b
		}, #The list of all allowed side for input and output
		filter:{
			id:<The minecraft item id>,
			ctc:{
				id:<custom id>,
				from:<custom from>
			}
			energy:1b #Test if the inputed item as energy
		}
	},
	(...)
]
```
Notes : 
- Only Slot and allowed_side are required
- You can declare multiple times the same slot

Some tags are very useful like :
- ``itemio.container.nope`` : If your are using a container as a custom block but without the posibility of input/output items you can add the tag.
- ``itemio.container.hopper`` : To make the container compatible with hoppers just add the tag.
- ``itemio.container.not_vanilla_container`` : if the custom container does not use a vanilla container (used in SimpleDrawer with beehives)
- ``itemio.container.auto_handled_io`` : if you want all the control on input/output (advanced use, see [SimpleDrawer](https://github.com/edayot/SimpleDrawer/tree/master/SimpleDrawer%20DataPack/data/itemio/tags/functions/event))


### - Item cables
ItemIO provide a simple way to add cables that can transport items. They had to have the tag ``itemio.cable`` and run these functions : 
- On place : ``function #itemio:calls/cables/init``
- On destroy : ``function #itemio:calls/cables/destroy``

### - Item Servo
ItemIO provide a simple way to add servos that can insert/extract items from containers. They are interface between the cables and the containers.

They had to be item_frames, to have the tag ``itemio.servo``, either the tag ``itemio.servo.insert`` or ``itemio.servo.extract`` and run this function : 
- On place : ``function #itemio:calls/servos/init``

There is also configurable scores for servos :
- `itemio.servo.stack_limit` that configure how many items pass through the servo per try 
- `itemio.servo.retry_limit` that configure how many try the servo per second (only working for extract servos)

The insert servo will just limit the `itemio.servo.stack_limit` when it insert the item


## Contributing

Contributions are always welcome! The datapack is compiled using the [beet](https://mcbeet.dev) .

```bash
$ git clone https://github.com/edayot/ItemIO.git
$ cd ItemIO

$ beet
```
