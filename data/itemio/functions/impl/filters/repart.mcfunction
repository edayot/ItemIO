# @public
# These are example of integrated filter
# Remember : Do not modify any of the input data 

# Inputs :
# storage itemio:io filter
# storage itemio:io item

# Outputs :
# score #filter.valid_item itemio.math
# The score is 1 if the item is valid and act as an AND gate for all the filters



execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.energy run function itemio:impl/container/integrated_filters/energy
execute if score #filter.valid_item itemio.io matches 1 if data storage itemio:io filter.id run function itemio:impl/container/integrated_filters/id