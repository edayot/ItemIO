import os

for i in range(2):
	print(i)
	try:
		os.mkdir(str(i))
	except:
		pass
	try:
		os.mkdir(str(i)+"/if_item")
	except:
		pass
	try:
		os.mkdir(str(i)+"/if_item/sup")
	except:
		pass
	try:
		os.mkdir(str(i)+"/if_item/inf")
	except:
		pass
	repart="""execute store success score #if_item itemio.math if data storage itemio:main Items[{Slot:XXXb}]
execute if score #if_item itemio.math matches 0 run function itemio:working/custom/try_input/XXX/unless_item
execute if score #if_item itemio.math matches 1 run function itemio:working/custom/try_input/XXX/if_item

	""".replace("XXX",str(i))
	with open(str(i)+"/repart.mcfunction","w") as f:
		f.write(repart)
	
	unless_item="""


scoreboard players set #success_input itemio.math 1

scoreboard players set #full_stack itemio.math 64

data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage itemio:main input.id
execute as 0015d1f0-0000-008f-0000-000000000000 if predicate itemio:stack16 run scoreboard players set #full_stack itemio.math 16
execute as 0015d1f0-0000-008f-0000-000000000000 if predicate itemio:stack1 run scoreboard players set #full_stack itemio.math 1

data modify storage itemio:main input.Slot set value XXXb

execute store result score #count_input itemio.math run data get storage itemio:main input.Count

scoreboard players set #new_count_input itemio.math 0
execute if score #count_input itemio.math <= #full_stack itemio.math run scoreboard players set #full_input itemio.math 1
execute if score #count_input itemio.math > #full_stack itemio.math run scoreboard players set #full_input itemio.math 0
execute if score #count_input itemio.math > #full_stack itemio.math run scoreboard players operation #new_count_input itemio.math = #count_input itemio.math
execute if score #count_input itemio.math > #full_stack itemio.math run scoreboard players operation #new_count_input itemio.math -= #full_stack itemio.math
execute if score #count_input itemio.math > #full_stack itemio.math store result storage itemio:main input.Count int 1 run scoreboard players get #new_count_input itemio.math

data modify block ~ ~ ~ Items append from storage itemio:main input
""".replace("XXX",str(i))
	with open(str(i)+"/unless_item.mcfunction","w") as f:
		f.write(unless_item)
	
	if_item="""execute store result score #count_container itemio.math run data get storage itemio:main Items[{Slot:XXXb}].Count
execute store result score #count_input itemio.math run data get storage itemio:main input.Count


scoreboard players set #full_stack itemio.math 64

data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage itemio:main input.id
execute as 0015d1f0-0000-008f-0000-000000000000 if predicate itemio:stack16 run scoreboard players set #full_stack itemio.math 16
execute as 0015d1f0-0000-008f-0000-000000000000 if predicate itemio:stack1 run scoreboard players set #full_stack itemio.math 1

scoreboard players set #new_count_container itemio.math 0
scoreboard players operation #new_count_container itemio.math = #count_container itemio.math
scoreboard players operation #new_count_container itemio.math += #count_input itemio.math

execute if score #new_count_container itemio.math <= #full_stack itemio.math run function itemio:working/custom/try_input/XXX/if_item/inf/test_nbt
execute if score #new_count_container itemio.math > #full_stack itemio.math if score #count_container itemio.math < #full_stack itemio.math run function itemio:working/custom/try_input/XXX/if_item/sup/test_nbt
""".replace("XXX",str(i))
	with open(str(i)+"/if_item.mcfunction","w") as f:
		f.write(if_item)

	if_item_inf_test_nbt="""data modify storage itemio:main temp.Item1 set from storage itemio:main input
data modify storage itemio:main temp.Item2 set from storage itemio:main Items[{Slot:XXXb}]

data remove storage itemio:main temp.Item1.Slot
data remove storage itemio:main temp.Item1.Count
data remove storage itemio:main temp.Item2.Slot
data remove storage itemio:main temp.Item2.Count

execute store success score #!same_item itemio.math run data modify storage itemio:main temp.Item1 set from storage itemio:main temp.Item2
execute if score #!same_item itemio.math matches 0 run function itemio:working/custom/try_input/XXX/if_item/inf/fill
""".replace("XXX",str(i))
	with open(str(i)+"/if_item/inf/test_nbt.mcfunction","w") as f:
		f.write(if_item_inf_test_nbt)
	
	if_item_inf_fill="""item modify block ~ ~ ~ container.XXX itemio:add_count_input
scoreboard players set #success_input itemio.math 1
scoreboard players set #full_input itemio.math 1
""".replace("XXX",str(i))
	with open(str(i)+"/if_item/inf/fill.mcfunction","w") as f:
		f.write(if_item_inf_fill)

	if_item_sup_test_nbt="""data modify storage itemio:main temp.Item1 set from storage itemio:io input
data modify storage itemio:main temp.Item2 set from storage itemio:main Items[{Slot:XXXb}]

data remove storage itemio:main temp.Item1.Slot
data remove storage itemio:main temp.Item1.Count
data remove storage itemio:main temp.Item2.Slot
data remove storage itemio:main temp.Item2.Count

execute store success score #!same_item itemio.math run data modify storage itemio:main temp.Item1 set from storage itemio:main temp.Item2
execute if score #!same_item itemio.math matches 0 run function itemio:working/custom/try_input/XXX/if_item/sup/fill
""".replace("XXX",str(i))
	with open(str(i)+"/if_item/sup/test_nbt.mcfunction","w") as f:
		f.write(if_item_sup_test_nbt)

	if_item_sup_fill="""execute store result storage itemio:main Items[{Slot:XXXb}].Count byte 1 run scoreboard players get #full_stack itemio.math
execute store result block ~ ~ ~ Items[{Slot:XXXb}].Count byte 1 run scoreboard players get #full_stack itemio.math

scoreboard players set #new_count_input itemio.math 0
scoreboard players operation #new_count_input itemio.math = #full_stack itemio.math
scoreboard players operation #new_count_input itemio.math -= #count_input itemio.math
execute store result storage itemio:main input.Count int 1 run scoreboard players get #new_count_input itemio.math

scoreboard players set #success_input itemio.math 1
scoreboard players set #full_input itemio.math 0

""".replace("XXX",str(i))
	with open(str(i)+"/if_item/sup/fill.mcfunction","w") as f:
		f.write(if_item_sup_fill)
	

