# Test support (itemio_test:auto_handled_io) : an auto handled container storing up to 64 stone in data.stock

execute unless entity @s[tag=itemio.test.auto_container] run return fail
execute unless data storage itemio:io input{id:"minecraft:stone"} run return fail

execute store result score #test_stock itemio.math run data get entity @s data.stock
execute store result score #test_accepted itemio.math run data get storage itemio:io input.count
scoreboard players set #test_space itemio.math 64
scoreboard players operation #test_space itemio.math -= #test_stock itemio.math
execute if score #test_accepted itemio.math > #test_space itemio.math run scoreboard players operation #test_accepted itemio.math = #test_space itemio.math

scoreboard players operation #test_stock itemio.math += #test_accepted itemio.math
execute store result entity @s data.stock int 1 run scoreboard players get #test_stock itemio.math
scoreboard players operation #count_to_remove itemio.io = #test_accepted itemio.math
