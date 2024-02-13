

from itemio import generate_predicates



def tag_offset(offset):
    offset_float = offset / 10
    generate_predicates(ctx, offset_float)

    pred_1 = f"itemio:impl/container/hopper_x_plus_{offset_float}"
    pred_2 = f"itemio:impl/container/hopper_z_plus_{offset_float}"
    pred_3 = f"itemio:impl/container/hopper_x_minus_{offset_float}"
    pred_4 = f"itemio:impl/container/hopper_z_minus_{offset_float}"

    tag_name = f"itemio.container.hopper_protection_{offset}"
    function_name = f"itemio:impl/container/disabling_hopper/{offset}"


    raw f"execute if entity @s[tag={tag_name}] run function {function_name}"

    function function_name:
        execute
            if predicate pred_1
            positioned ~offset_float ~ ~
            run function itemio:impl/container/hopper

        execute
            if predicate pred_2
            positioned ~ ~ ~offset_float
            run function itemio:impl/container/hopper

        execute
            if predicate pred_3
            positioned ~-offset_float ~ ~
            run function itemio:impl/container/hopper

        execute
            if predicate pred_4
            positioned ~ ~ ~-offset_float
            run function itemio:impl/container/hopper


for offset in range(1, 20):
    tag_offset(offset)



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