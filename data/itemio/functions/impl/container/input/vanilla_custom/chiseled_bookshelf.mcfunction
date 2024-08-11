# Chiseled Bookshelf
# There are using a custom ioconfig

data modify storage itemio:main.input ioconfig set value [ \
    {Slot:0b,allowed_side:{top:1b,bottom:1b,north:1b,south:1b,east:1b,west:1b},filters:[{minecraft:{bookshelf_books:{}}}], max_stack_size: 1}, \
    {Slot:1b,allowed_side:{top:1b,bottom:1b,north:1b,south:1b,east:1b,west:1b},filters:[{minecraft:{bookshelf_books:{}}}], max_stack_size: 1}, \
    {Slot:2b,allowed_side:{top:1b,bottom:1b,north:1b,south:1b,east:1b,west:1b},filters:[{minecraft:{bookshelf_books:{}}}], max_stack_size: 1}, \
    {Slot:3b,allowed_side:{top:1b,bottom:1b,north:1b,south:1b,east:1b,west:1b},filters:[{minecraft:{bookshelf_books:{}}}], max_stack_size: 1}, \
    {Slot:4b,allowed_side:{top:1b,bottom:1b,north:1b,south:1b,east:1b,west:1b},filters:[{minecraft:{bookshelf_books:{}}}], max_stack_size: 1}, \
    {Slot:5b,allowed_side:{top:1b,bottom:1b,north:1b,south:1b,east:1b,west:1b},filters:[{minecraft:{bookshelf_books:{}}}], max_stack_size: 1}, \
    ]


function itemio:impl/container/input/custom/input_noconfig

function itemio:impl/container/chiseled_bookshelf