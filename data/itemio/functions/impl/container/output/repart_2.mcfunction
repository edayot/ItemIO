execute align xyz positioned ~.5 ~.5 ~.5 run tag @e[type=#itemio:container,tag=itemio.container.initialised,distance=..0.5001,limit=1,sort=nearest] add itemio.selected.output
execute as @e[tag=itemio.selected.output,tag=!itemio.container.nope,tag=!itemio.container.auto_handled_io] run function itemio:impl/container/output/custom/output
execute unless entity @e[tag=itemio.selected.output,tag=!itemio.container.nope,tag=!itemio.container.auto_handled_io] if block ~ ~ ~ #itemio:container run function itemio:impl/container/output/vanilla/output
execute as @e[tag=itemio.selected.output,tag=itemio.container.auto_handled_io,tag=!itemio.container.nope] run function #itemio:event/auto_handled_output
tag @e[tag=itemio.selected.output] remove itemio.selected.output