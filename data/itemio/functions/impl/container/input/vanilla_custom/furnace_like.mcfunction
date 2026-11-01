# Furnace, Blast Furnace, Smoker 
# There are using a custom ioconfig

data modify storage itemio:main.input config set value {}
data modify storage itemio:main.input config.ioconfig set value [ \
    {Slot:0b,allowed_side:{top:1b}}, \
    {Slot:1b,allowed_side:{north:1b,south:1b,east:1b,west:1b,bottom:1b}} \
    ]


function itemio:impl/container/input/custom/input_noconfig