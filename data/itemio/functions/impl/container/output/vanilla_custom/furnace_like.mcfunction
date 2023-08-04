# Furnace, Blast Furnace, Smoker 
# There are using a custom ioconfig

data modify storage itemio:main.input ioconfig set value [ \
    {Slot:0b,allowed_side:{top:1b}}, \
    {Slot:1b,allowed_side:{north:1b,south:1b,east:1b,west:1b}} \
    {Slot:2b,allowed_side:{bottom:1b}} \
    ]


function itemio:impl/container/input/custom/output_noconfig