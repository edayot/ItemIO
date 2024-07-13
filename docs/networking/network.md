# 🌐 Network

> Every cables system is a network 



## Unique identifier
All network component have a `itemio.network_id.low` and `itemio.network_id.high` scores, it's a unique identifier for separating networks.

It's updated at every cable/servo placement or removal.


## Functionalities

What ItemIO does every second for each network (each network is not processed at the same time) :

1. Take all network
2. For each network process them :
    1. All insert servos generate a destination 
    2. All extract servos process a a number of transfer by them retry limit
    3. Clear the destination and restart



