

execute
    if predicate itemio:impl/hopper
    run function itemio:impl/container/hopper:
        execute positioned ~ ~-1 ~ if block ~ ~ ~ hopper run data modify block ~ ~ ~ TransferCooldown set value 12
        execute positioned ~ ~1 ~ if block ~ ~ ~ hopper[facing=down] run data modify block ~ ~ ~ TransferCooldown set value 12
        execute positioned ~ ~ ~-1 if block ~ ~ ~ hopper[facing=south] run data modify block ~ ~ ~ TransferCooldown set value 12
        execute positioned ~ ~ ~1 if block ~ ~ ~ hopper[facing=north] run data modify block ~ ~ ~ TransferCooldown set value 12
        execute positioned ~-1 ~ ~ if block ~ ~ ~ hopper[facing=east] run data modify block ~ ~ ~ TransferCooldown set value 12
        execute positioned ~1 ~ ~ if block ~ ~ ~ hopper[facing=west] run data modify block ~ ~ ~ TransferCooldown set value 12



execute 
    if predicate itemio:impl/activator_rail
    run function itemio:impl/container/activator_rail:
        execute positioned ~ ~-1 ~ if block ~ ~ ~ activator_rail run setblock ~ ~ ~ air destroy

        execute positioned ~1 ~-1 ~ if block ~ ~ ~ activator_rail run setblock ~ ~ ~ air destroy
        execute positioned ~-1 ~-1 ~ if block ~ ~ ~ activator_rail run setblock ~ ~ ~ air destroy
        execute positioned ~ ~-1 ~1 if block ~ ~ ~ activator_rail run setblock ~ ~ ~ air destroy
        execute positioned ~ ~-1 ~-1 if block ~ ~ ~ activator_rail run setblock ~ ~ ~ air destroy

        execute positioned ~ ~-2 ~ if block ~ ~ ~ activator_rail run setblock ~ ~ ~ air destroy

        execute positioned ~1 ~-2 ~ if block ~ ~ ~ activator_rail run setblock ~ ~ ~ air destroy
        execute positioned ~-1 ~-2 ~ if block ~ ~ ~ activator_rail run setblock ~ ~ ~ air destroy
        execute positioned ~ ~-2 ~1 if block ~ ~ ~ activator_rail run setblock ~ ~ ~ air destroy
        execute positioned ~ ~-2 ~-1 if block ~ ~ ~ activator_rail run setblock ~ ~ ~ air destroy