# Called once for each container (on init, or on its first tick for the ones initialised before 2.0.0)

tag @s add itemio.container.v2
scoreboard players add @s itemio.minecart_check 0

# a single tag tells if one of the itemio.container.hopper_protection_{offset} tags is used
for offset in range(1, 20):
    raw f"execute if entity @s[tag=itemio.container.hopper_protection_{offset}] run tag @s add itemio.container.hopper_protection"
