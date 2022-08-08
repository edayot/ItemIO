execute store result score #count_container itemio.math run data get storage itemio:main Items[{Slot:23b}].Count
execute store result score #count_input itemio.math run data get storage itemio:main input.Count


scoreboard players set #full_stack itemio.math 64

data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage itemio:main input.id
execute as 0015d1f0-0000-008f-0000-000000000000 if predicate itemio:stack16 run scoreboard players set #full_stack itemio.math 16
execute as 0015d1f0-0000-008f-0000-000000000000 if predicate itemio:stack1 run scoreboard players set #full_stack itemio.math 1

scoreboard players set #new_count_container itemio.math 0
scoreboard players operation #new_count_container itemio.math = #count_container itemio.math
scoreboard players operation #new_count_container itemio.math += #count_input itemio.math

execute if score #new_count_container itemio.math <= #full_stack itemio.math run function itemio:working/custom/try_input/23/if_item/inf/test_nbt
execute if score #new_count_container itemio.math > #full_stack itemio.math if score #count_container itemio.math < #full_stack itemio.math run function itemio:working/custom/try_input/23/if_item/sup/test_nbt
