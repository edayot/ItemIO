
scoreboard players operation #search_id itemio.math = @e[tag=itemio.cable,limit=1,sort=nearest] itemio.network_id
execute as @e[tag=itemio.cable] if score @s itemio.network_id = #search_id itemio.math at @s run summon shulker ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,Glowing:1b,NoAI:1b,AttachFace:0b,Tags:["example.shulker"]}
schedule function example:kill_shulkers 5s



