# ItemIO

A library for interacting items between datapacks
They are integrated feature like servo management and cable management.


## Features :

### - Containers
All item frames, marker and armor_stand can be declared as custom container with the tag ``itemio.container``

You can configure the input/output feature in there entity data the path is :

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
- If your are using a container as a custom block but without the posibility of input/output items you can add the tag ``itemio.container.nope``
- To make the container compatible with hoppers just add the tag ``itemio.container.hopper``


### - Item cables
ItemIO provide a simple way to add cables that can transport items. They had to have the tag ``itemio.cable`` and run these functions : 
- On place : ``function #itemio:calls/cables/init``
- On destroy : ``function #itemio:calls/cables/destroy``

### - Item Servo
ItemIO provide a simple way to add servos that can insert/extract items from containers. They had to be item_frames, to have the tag ``itemio.servo``, either the tag ``itemio.servo.insert`` or ``itemio.servo.extract`` and run this functions : 
- On place : ``function #itemio:calls/servos/init``

