# @public
# These are example of integrated filter
# Remember : Do not modify any of the input data 

# Inputs :
# storage itemio:io filters
# storage itemio:io item

# Outputs :
# score #filter.valid_item itemio.io
# The score is 1 if the item is valid and act as an OR gate for all the filters 
# (called individually by #itemio:event/filter_v2)


scoreboard players set #filters.valid_item itemio.io 0

data remove storage itemio:main temp.filters
data modify storage itemio:main temp.filters set from storage itemio:io filters

execute if data storage itemio:main temp.filters[0] run function itemio:impl/filters/call/loop



