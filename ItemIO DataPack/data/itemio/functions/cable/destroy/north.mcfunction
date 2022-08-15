scoreboard players remove @s itemio.math 8
function #itemio:event/cable_update
execute if entity @s[tag=!itemio.network.already_regenerated] run function itemio:cable/destroy/regen