# 🌐 Network

> Every cables system is a network 



## Unique identifier
All network component have a `itemio.network_id.low` and `itemio.network_id.high`, it's a unique identifier for separacting networks.

It's updated at every cable/servo placement


## Functionalities

What ItemIO does every second for each network (for imroving performance not all network are process on the same tick) :

1. Take all network
2. For each network process them :
    1. For each extract servo, the insert servos of the network (that are not in cooldown) are its destinations, nearest first
    2. The extract servo makes transfers to its destinations, up to its retry limit (it stops at the first transfer that fails)



