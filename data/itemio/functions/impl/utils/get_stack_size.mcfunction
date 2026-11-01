
# Receive an item in
# storage itemio:main get_stack_size
# return the stack size of the item, with 1 as fallback
# Used entity : a97c9c67-fde0-4b89-926d-54fa4a866004

# `item modify` always clamps the count of the modified item to its max stack size
# (the minecraft:max_stack_size component if any, else the default of the item).
# So setting a count of 99 (the highest count of an item stack) on a copy of the item,
# then reading the count back, gives the max stack size in one try.

# The count is set to 1 first : the copy must be a valid item stack (count 1..99)
data modify storage itemio:main get_stack_size.count set value 1
data modify entity a97c9c67-fde0-4b89-926d-54fa4a866004 item set from storage itemio:main get_stack_size
item modify entity a97c9c67-fde0-4b89-926d-54fa4a866004 contents itemio:impl/internal/max_count
execute store result score #stack_size itemio.math if items entity a97c9c67-fde0-4b89-926d-54fa4a866004 contents *

# an invalid item gives an empty copy
execute if score #stack_size itemio.math matches 0 run return 1
return run scoreboard players get #stack_size itemio.math
