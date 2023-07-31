> A function that extract an item from a container.

---

### Inputs

| Input Name                                                        | Input Type   | Input Source             | Input Objective/Path             | 
| ---                                                               | ---          | ---                      | ---                              |
| The selected container                                            | Position     |                          |                                  |
| The maximum amount of extracted item.<br> range 1..64             | score        | #smax_count_output       | itemio.io                        | 
| The output side : <br>```"north", "south", "east", "west", "top", "bottom", "wireless"``` (wireless bypass the side check)                | storage      | output_side               | itemio:io                        |
| Optional, it will do a full NBT check<br> `A normal item NBT`     | storage      | input                    | itemio:io                        |
| Optional, it will do a [filters](https://edayot.github.io/ItemIO/html/filters/index.html) check                             | storage      | input                    | itemio:io                        |

---

### Outputs

| Output Name                                       | Output Type  | Output Source            | Output Objective/Path            |
| ---                                               | ---          | ---                      | ---                              |
| Success of the function : <br>`1 or 0`            | score        | #success_output          | itemio.io                        | 
| The item that as been extract                     | storage      | output                   | itemio:io                        |


