# ⚙️ Configuration


## Maximum network processing per tick

The scoreboard `#max_network_per_tick itemio.math` controls the maximum amount of networks that can work on the same tick (default: 2 | 0 => disabled). 

This correspond to around 40 different networks working in the same second. Networks are processed in a random order each tick, so if you have more networks than the configured value, so all networks will still be processed at some point™.

A network is processed at most once per tick.


## Maximum servos processed per tick

The scoreboard `#max_servos_per_tick itemio.math` controls the maximum amount of servos that can work on the same tick (default: 128 | 0 => disabled).
When the limit is reached, the next networks wait for the next ticks.


## Hopper speed

The scoreboard `#hopper_speed itemio.math` (default: 8) is the number of ticks between two transfers of the hoppers around a custom container with the tag `itemio.container.hopper` (the vanilla hopper cooldown).


## Network queue

The scoreboard `#process_queue itemio.math` (default: 20) is the number of ticks between two processing of the same network.