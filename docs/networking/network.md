# 🌐 Network

> Every cables system is a network 



## Unique identifier
All network component have a `itemio.network_id.low` and `itemio.network_id.high`, it's a unique identifier for separacting networks.

It's updated at every cable/servo placement


## Functionalities

What ItemIO does every second for each network (for imroving performance not all network are process on the same tick) :

1. Take all network
2. For each network process them :
    1. All insert servos generate a destination 
    2. All extract servos process a a number of transfer by them retry limit
    3. They clear the destination and restart



