# ⚙️ Configuration


## Maximum network processing per tick

The scoreboard `#max_network_per_tick itemio.math` controls the maximum amount of networks that can work on the same tick (default: 2 | 0 => disabled). 

This correspond to around 40 different networks working in the same second. Networks are processed in a random order each tick, so if you have more networks than the configured value, so all networks will still be processed at some point™.


## Maximum servos processed per tick

The scoreboard `#max_servos_per_tick itemio.math` controls the maximum amount of servos that can work on the same tick (default: 128 | 0 => disabled).