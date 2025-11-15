execute 
    if score @s itemio.network_id.low matches 1.. 
    if entity @s[tag=!itemio.servo.already] 
    if score @s itemio.servo.cooldown matches 0 
    run function itemio:impl/servo/working