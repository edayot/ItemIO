#define storage itemio:main


scoreboard players set itemio load.status 1
function itemio:set_version

gamerule maxCommandChainLength 2147483647
scoreboard objectives add itemio.math dummy




schedule function itemio:tick 1t replace