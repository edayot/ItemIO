scoreboard players remove @s itemio.math 32
function #itemio:event/cable_update
execute if entity @s[tag=!itemio.network.already_regenerated] run function itemio:v0.0.1/cable/destroy/regen