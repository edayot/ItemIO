# brewing_stand
# There are using a custom ioconfig

data modify storage itemio:main.input ioconfig set value [ \
    {Slot:0b,allowed_side:{north:1b,south:1b,east:1b,west:1b},filters:[{id:["minecraft:potion","minecraft:splash_potion","minecraft:lingering_potion","minecraft:water_bottle"]}]}, \ 
    {Slot:1b,allowed_side:{north:1b,south:1b,east:1b,west:1b},filters:[{id:["minecraft:potion","minecraft:splash_potion","minecraft:lingering_potion","minecraft:water_bottle"]}]}, \ 
    {Slot:2b,allowed_side:{north:1b,south:1b,east:1b,west:1b},filters:[{id:["minecraft:potion","minecraft:splash_potion","minecraft:lingering_potion","minecraft:water_bottle"]}]}, \ 
    {Slot:3b,allowed_side:{top:1b}}, \ 
    {Slot:4b,allowed_side:{north:1b,south:1b,east:1b,west:1b},filters:{id:["minecraft:blaze_powder"]}}, \ 
    ]


function itemio:impl/container/input/custom/input_noconfig