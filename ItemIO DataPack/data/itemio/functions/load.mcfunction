#define storage itemio:main


scoreboard players set itemio load.status 1
function itemio:set_version
forceload add -30000000 1600

schedule function itemio:load_2 2s


gamerule maxCommandChainLength 2147483647
scoreboard objectives add itemio.math dummy


tag AirDox_ add convention.debug
execute as @a[tag=convention.debug] run function itemio:print_version

schedule function itemio:tick 1t replace