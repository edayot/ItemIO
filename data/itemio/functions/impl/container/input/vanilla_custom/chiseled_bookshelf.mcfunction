# Chiseled Bookshelf
# There are using a custom ioconfig

data modify storage itemio:main.input ioconfig set value [ \
    {Slot:0b,allowed_side:{top:1b,bottom:1b,north:1b,south:1b,east:1b,west:1b},filters:[{minecraft:{bookshelf_books:{}}}]}, \
    {Slot:1b,allowed_side:{top:1b,bottom:1b,north:1b,south:1b,east:1b,west:1b},filters:[{minecraft:{bookshelf_books:{}}}]}, \
    {Slot:2b,allowed_side:{top:1b,bottom:1b,north:1b,south:1b,east:1b,west:1b},filters:[{minecraft:{bookshelf_books:{}}}]}, \
    {Slot:3b,allowed_side:{top:1b,bottom:1b,north:1b,south:1b,east:1b,west:1b},filters:[{minecraft:{bookshelf_books:{}}}]}, \
    {Slot:4b,allowed_side:{top:1b,bottom:1b,north:1b,south:1b,east:1b,west:1b},filters:[{minecraft:{bookshelf_books:{}}}]}, \
    {Slot:5b,allowed_side:{top:1b,bottom:1b,north:1b,south:1b,east:1b,west:1b},filters:[{minecraft:{bookshelf_books:{}}}]}, \
    ]


function itemio:impl/container/input/custom/input_noconfig

function itemio:impl/container/chiseled_bookshelf