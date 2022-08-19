execute as @e[type=#itemio:item_frames,tag=itemio.servo.extract] run function itemio:servo/test_already
tag @e[tag=itemio.servo.already] remove itemio.servo.already

schedule function itemio:20tick 20t replace