# Computes data.itemio.target of the servo (@s, executed at @s) : the block behind the servo {x, y, z}
# and the side of this block where the servo is (side)
# Also returned in storage itemio:main servo.target

execute positioned ^ ^ ^-1 align xyz summon marker run function ~/store_pos:
    data modify storage itemio:main servo.pos set from entity @s Pos
    kill @s

data modify storage itemio:main servo.target set value {}
execute store result storage itemio:main servo.target.x int 1 run data get storage itemio:main servo.pos[0]
execute store result storage itemio:main servo.target.y int 1 run data get storage itemio:main servo.pos[1]
execute store result storage itemio:main servo.target.z int 1 run data get storage itemio:main servo.pos[2]

execute store result score #facing itemio.math run data get entity @s Facing
execute if score #facing itemio.math matches 0 run data modify storage itemio:main servo.target.side set value "bottom"
execute if score #facing itemio.math matches 1 run data modify storage itemio:main servo.target.side set value "top"
execute if score #facing itemio.math matches 2 run data modify storage itemio:main servo.target.side set value "north"
execute if score #facing itemio.math matches 3 run data modify storage itemio:main servo.target.side set value "south"
execute if score #facing itemio.math matches 4 run data modify storage itemio:main servo.target.side set value "west"
execute if score #facing itemio.math matches 5 run data modify storage itemio:main servo.target.side set value "east"

data modify entity @s data.itemio.target set from storage itemio:main servo.target
