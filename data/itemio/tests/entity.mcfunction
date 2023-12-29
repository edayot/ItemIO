

say Running 
execute as @a at @s run function itemio:impl/print_version

await entity 93682a08-d099-4e8f-a4a6-1e33a3692301


assert block -30000000 22 1610 yellow_shulker_box
assert block -30000000 23 1610 barrel

setblock ~ ~4 ~ stone