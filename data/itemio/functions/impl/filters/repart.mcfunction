# @public
# These are example of integrated filter
# Remember : Do not modify any of the input data 

# Inputs :
# storage itemio:io filter
# storage itemio:io item

# Outputs :
# score #filter.valid_item itemio.math
# The score is 1 if the item is valid and act as an AND gate for all the filters






execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.energy run function itemio:impl/filters/energy
execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.id run function itemio:impl/filters/id
execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.ctc run function itemio:impl/filters/ctc
execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.smithed.id run function itemio:impl/filters/smithed_id
execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.merge as 93682a08-d099-4e8f-a4a6-1e33a3692301 run function itemio:impl/filters/merge
execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.item_predicate as 93682a08-d099-4e8f-a4a6-1e33a3692301 run function itemio:impl/filters/item_predicate with storage itemio:io filter
function ./minecraft_tags

#tellraw @a {"score":{"name":"#filter.valid_item","objective":"itemio.io"}}
