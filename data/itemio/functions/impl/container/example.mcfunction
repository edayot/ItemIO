
setblock ~ ~ ~ barrel

data modify entity @s item.tag.itemio.ioconfig set value []
data modify entity @s item.tag.itemio.ioconfig append value {
    Slot:0b,
    mode: "input",
    allowed_side:{bottom:1b},
    filters:[
        {id:["minecraft:dirt"]}
    ]
}
data modify entity @s item.tag.itemio.ioconfig append value {
    Slot:1b,
    mode: "input",
    allowed_side:{bottom:1b},
    filters:[
        {id:["minecraft:dirt"]}
    ]
}
tag @s add itemio.container # The required tag
tag @s add itemio.container.hopper # To make it work with hoppers
function #itemio:calls/container/init