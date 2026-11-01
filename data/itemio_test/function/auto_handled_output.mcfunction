# Test support (itemio_test:auto_handled_io) : an auto handled container storing up to 64 stone in data.stock

execute unless entity @s[tag=itemio.test.auto_container] run return fail
execute store result score #test_stock itemio.math run data get entity @s data.stock
execute unless score #test_stock itemio.math matches 1.. run return fail

data modify storage itemio:io offer set value {id:"minecraft:stone"}
execute store result storage itemio:io offer.count int 1 run scoreboard players get #test_stock itemio.math
function #itemio:calls/offer

execute if score #success_output itemio.io matches 1 run scoreboard players operation #test_stock itemio.math -= #count_to_remove itemio.io
execute store result entity @s data.stock int 1 run scoreboard players get #test_stock itemio.math
