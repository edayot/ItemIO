> A function that transfer items from a container to multiple ones

---

### Inputs

| Input Name                                                        | Input Type   | Input Source             | Input Objective/Path             | 
| ---                                                               | ---          | ---                      | ---                              |
| All inputs from `#itemio:calls/output`                            |              |                          |                                  |
| Positions of others containers ``itemio.transfer.destination``    | Marker entities |                          |                                  |

All markers have : 
- ``data.itemio.input_side`` : ```"north", "south", "east", "west", "top", "bottom", "wireless"``` (wireless bypass the side check)
- ``data.itemio.ioconfig.filters`` : [filters](https://edayot.github.io/ItemIO/filters/index.html)
- ``data.itemio.ioconfig.inputs`` : A list of multiple items (NBTMatch ORed)




### Outputs

| Output Name                                       | Output Type  | Output Source            | Output Objective/Path            |
| ---                                               | ---          | ---                      | ---                              |
| Success of the function : <br>`1 or 0`            | score        | #success_transfer        | itemio.io                        | 


