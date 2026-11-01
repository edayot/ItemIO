> A function that transfer items from a container to multiple ones

---

### Inputs

| Input Name                                                        | Input Type   | Input Source             | Input Objective/Path             | 
| ---                                                               | ---          | ---                      | ---                              |
| All inputs from `#itemio:calls/output`                            |              |                          |                                  |
| The destinations (optional, else the destination markers)         | storage      | destinations             | itemio:io                        |
| Positions of others containers ``itemio.transfer.destination``    | Marker entities |                          |                                  |

The destinations are tried nearest first, the item goes to the first one that accepts it.
A destination at the position of the origin is ignored.

#### `storage itemio:io destinations`

A list of destinations, in the order they are tried. It is removed by the call.
When it is set, the markers are not used (faster : no entity is searched).

```ts
[
    {
        x: number, y: number, z: number, // the position of the destination
        // or dx, dy, dz : the position relative to the origin
        input_side: "north" | "south" | "east" | "west" | "top" | "bottom" | "wireless",
        filters: Filters, // optional, see filters
        items: Item[], // optional, a list of exact items (ORed), ignored when filters are set
        stack_limit: int, // optional, the maximum count inserted
    },
    (...)
]
```

#### Destination markers

All markers ``@e[tag=itemio.transfer.destination]`` (searched once per call) have : 
- ``data.itemio.input_side`` (or ``data.itemio.ioconfig.input_side``) : ```"north", "south", "east", "west", "top", "bottom", "wireless"``` (wireless bypass the side check)
- ``data.itemio.ioconfig.filters`` : [filters](https://edayot.github.io/ItemIO/filters/index.html)
- ``data.itemio.ioconfig.items`` : A list of multiple items (NBTMatch ORed)
- optionally, the score ``itemio.servo.stack_limit`` : the maximum count inserted



### Outputs

| Output Name                                       | Output Type  | Output Source            | Output Objective/Path            |
| ---                                               | ---          | ---                      | ---                              |
| Success of the function : <br>`1 or 0`            | score        | #success_transfer        | itemio.io                        |

### Example

```{code-block} mcfunction
:force:
# moves 4 items from the barrel at ~ ~1 ~ to the container below
scoreboard players set #max_output_count itemio.io 4
data modify storage itemio:io output_side set value "bottom"
data remove storage itemio:io input
data remove storage itemio:io filters
data modify storage itemio:io destinations set value [{dx:0,dy:-1,dz:0,input_side:"top"}]
execute positioned ~ ~1 ~ run function #itemio:calls/transfer
```
