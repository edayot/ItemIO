# 🧩 Function Calls



## `#itemio:event/filter_v2`

```{admonition} Disclaimer 
:class: warning 
This documentation is technical. Remember to not modify the input data.
```

A function tag to implement custom filters. Custom ones should be namespaced.

| Input Name                            | Input Type   | Input Source             | Input Objective/Path    | 
| ---                                   | ---          | ---                      | ---                     | 
| 'Success of the current filter'       | score        | #filter.valid_item       | itemio.io             | 
| 'The current filter'                  | storage      | filter                   | itemio:io               |
| 'The current item'                    | storage      | item                     | itemio:io               |


### Format :
The function tag will be called, implement your filters like this

```{code-block} mcfunction
:force:
execute 
    # First check if the item is already valid (filter are ANDed together)
    if score #filter.valid_item itemio.io matches 1 
    # Check if the filter is your custom one
    if data storage itemio:io filter.example.custom
    run function example:custom_filter:
        # Set the item invalid
        scoreboard players set #filter.valid_item itemio.io 0
        # Check if the item is valid
        # (...)
        # If the item is valid, set it valid by doing :
        # scoreboard players set #filter.valid_item itemio.io 1
```



### Example :
```{code-block} mcfunction
:force:
execute 
    # First check if the item is already valid (filter are ANDed together)
    if score #filter.valid_item itemio.io matches 1 
    # Check if the filter as an energy tag
    if data storage itemio:io filter.energy 
    run function itemio:impl/filters/energy:
        # Set the item invalid
        scoreboard players set #filter.valid_item itemio.io 0
        # If the item as an energy tag, it's valid
        execute 
            if data storage itemio:io item.components."minecraft:custom_data".energy 
            run scoreboard players set #filter.valid_item itemio.io 1
```
It's a filter that actually exist in the library check [this](https://github.com/edayot/ItemIO/blob/master/data/itemio/functions/impl/filters/repart.mcfunction).



## `#itemio:calls/filters_v2`

A function tag to call filters verifications. An empty filters is valid and return 1.

| Input Name                            | Input Type   | Input Source             | Input Objective/Path    | 
| ---                                   | ---          | ---                      | ---                     | 
| 'The filters'                         | storage      | filters                  | itemio:io               |
| 'The item'                            | storage      | item                     | itemio:io               |




| Output Name       | Output Type  | Output Source             | Output Objective/Path    | 
| ---               | ---          | ---                       | ---                     | 
| 'Success'         | score        | #filters.valid_item       | itemio.math             | 

