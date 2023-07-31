
> A function that insert an item in a container.

---

### Inputs

| Input Name                                                        | Input Type   | Input Source             | Input Objective/Path             | 
| ---                                                               | ---          | ---                      | ---                              | 
| The selected container                                            | Position     |                          |                                  |
| The item to input in the container<br> `A normal item NBT`          | storage      | input                    | itemio:io                        |
| The input side : <br>```"north", "south", "east", "west", "top", "bottom", "wireless"``` (wireless bypass the side check)                | storage      | input_side               | itemio:io                        |

---

### Outputs

| Output Name                                       | Output Type  | Output Source            | Output Objective/Path            |
| ---                                               | ---          | ---                      | ---                              |
| Success of the function : <br>`1 or 0`            | score        | #success_input           | itemio.io                        | 
| The number to remove from the input               | score        | #count_to_remove         | itemio.io                        | 
| What's left of the input                          | storage      | output                   | itemio:io                        |

To apply an input from the source (a player, a container ect) you can use this item modifier :

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