import os

for i in range(3*9):
	print("""execute if score #full_input itemio.math.input matches 0 if score #slot itemio.math.input matches XXX run function itemio:v0.0.1/container/input/custom/try_input/XXX/repart""".replace("XXX",str(i)))
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
	repart="""execute store success score #if_item itemio.math.input if data storage itemio:main.input Items[{Slot:XXXb}]
execute if score #if_item itemio.math.input matches 0 run function itemio:v0.0.1/container/input/custom/try_input/XXX/unless_item
execute if score #if_item itemio.math.input matches 1 run function itemio:v0.0.1/container/input/custom/try_input/XXX/if_item

	""".replace("XXX",str(i))
	with open(str(i)+"/repart.mcfunction","w") as f:
		f.write(repart)
	
	unless_item="""


scoreboard players set #success_input itemio.math.input 1

scoreboard players set #full_stack itemio.math.input 64

data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage itemio:main.input input.id
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack16 run scoreboard players set #full_stack itemio.math.input 16
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack1 run scoreboard players set #full_stack itemio.math.input 1

data modify storage itemio:main.input input.Slot set value XXXb

execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.Count

scoreboard players set #new_count_input itemio.math.input 0
execute if score #count_input itemio.math.input <= #full_stack itemio.math.input run data modify block ~ ~ ~ Items append from storage itemio:main.input input
execute if score #count_input itemio.math.input <= #full_stack itemio.math.input run scoreboard players set #full_input itemio.math.input 1
execute if score #count_input itemio.math.input <= #full_stack itemio.math.input run data modify storage itemio:main.input input.Count set value 0b
execute if score #count_input itemio.math.input > #full_stack itemio.math.input run scoreboard players set #full_input itemio.math.input 0
execute if score #count_input itemio.math.input > #full_stack itemio.math.input run scoreboard players operation #new_count_input itemio.math.input = #count_input itemio.math.input
execute if score #count_input itemio.math.input > #full_stack itemio.math.input run scoreboard players operation #new_count_input itemio.math.input -= #full_stack itemio.math.input
execute if score #count_input itemio.math.input > #full_stack itemio.math.input store result storage itemio:main.input input.Count int 1 run scoreboard players get #new_count_input itemio.math.input
execute if score #count_input itemio.math.input > #full_stack itemio.math.input run data modify block ~ ~ ~ Items append from storage itemio:main.input input


""".replace("XXX",str(i))
	with open(str(i)+"/unless_item.mcfunction","w") as f:
		f.write(unless_item)
	
	if_item="""execute store result score #count_container itemio.math.input run data get storage itemio:main.input Items[{Slot:XXXb}].Count
execute store result score #count_input itemio.math.input run data get storage itemio:main.input input.Count


scoreboard players set #full_stack itemio.math.input 64

data modify entity 93682a08-d099-4e8f-a4a6-1e33a3692301 HandItems[0].id set from storage itemio:main.input input.id
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack16 run scoreboard players set #full_stack itemio.math.input 16
execute as 93682a08-d099-4e8f-a4a6-1e33a3692301 if predicate itemio:stack1 run scoreboard players set #full_stack itemio.math.input 1

scoreboard players set #new_count_container itemio.math.input 0
scoreboard players operation #new_count_container itemio.math.input = #count_container itemio.math.input
scoreboard players operation #new_count_container itemio.math.input += #count_input itemio.math.input

execute if score #new_count_container itemio.math.input <= #full_stack itemio.math.input run function itemio:v0.0.1/container/input/custom/try_input/XXX/if_item/inf/test_nbt
execute if score #new_count_container itemio.math.input > #full_stack itemio.math.input if score #count_container itemio.math.input < #full_stack itemio.math.input run function itemio:v0.0.1/container/input/custom/try_input/XXX/if_item/sup/test_nbt
""".replace("XXX",str(i))
	with open(str(i)+"/if_item.mcfunction","w") as f:
		f.write(if_item)

	if_item_inf_test_nbt="""data modify storage itemio:main.input temp.Item1 set from storage itemio:main.input input
data modify storage itemio:main.input temp.Item2 set from storage itemio:main.input Items[{Slot:XXXb}]

data remove storage itemio:main.input temp.Item1.Slot
data remove storage itemio:main.input temp.Item1.Count
data remove storage itemio:main.input temp.Item2.Slot
data remove storage itemio:main.input temp.Item2.Count

execute store success score #!same_item itemio.math.input run data modify storage itemio:main.input temp.Item1 set from storage itemio:main.input temp.Item2
execute if score #!same_item itemio.math.input matches 0 run function itemio:v0.0.1/container/input/custom/try_input/XXX/if_item/inf/fill
""".replace("XXX",str(i))
	with open(str(i)+"/if_item/inf/test_nbt.mcfunction","w") as f:
		f.write(if_item_inf_test_nbt)
	
	if_item_inf_fill="""item modify block ~ ~ ~ container.XXX itemio:internal/input/add_count
scoreboard players set #success_input itemio.math.input 1
scoreboard players set #full_input itemio.math.input 1
data modify storage itemio:main.input input.Count set value 0b
""".replace("XXX",str(i))
	with open(str(i)+"/if_item/inf/fill.mcfunction","w") as f:
		f.write(if_item_inf_fill)

	if_item_sup_test_nbt="""data modify storage itemio:main.input temp.Item1 set from storage itemio:main.input input
data modify storage itemio:main.input temp.Item2 set from storage itemio:main.input Items[{Slot:XXXb}]

data remove storage itemio:main.input temp.Item1.Slot
data remove storage itemio:main.input temp.Item1.Count
data remove storage itemio:main.input temp.Item2.Slot
data remove storage itemio:main.input temp.Item2.Count

execute store success score #!same_item itemio.math.input run data modify storage itemio:main.input temp.Item1 set from storage itemio:main.input temp.Item2
execute if score #!same_item itemio.math.input matches 0 run function itemio:v0.0.1/container/input/custom/try_input/XXX/if_item/sup/fill
""".replace("XXX",str(i))
	with open(str(i)+"/if_item/sup/test_nbt.mcfunction","w") as f:
		f.write(if_item_sup_test_nbt)

	if_item_sup_fill="""execute store result storage itemio:main.input Items[{Slot:XXXb}].Count byte 1 run scoreboard players get #full_stack itemio.math.input
execute store result block ~ ~ ~ Items[{Slot:XXXb}].Count byte 1 run scoreboard players get #full_stack itemio.math.input

scoreboard players set #new_count_input itemio.math.input 0
scoreboard players operation #new_count_input itemio.math.input = #new_count_container itemio.math.input
scoreboard players operation #new_count_input itemio.math.input -= #full_stack itemio.math.input
execute store result storage itemio:main.input input.Count int 1 run scoreboard players get #new_count_input itemio.math.input

scoreboard players set #success_input itemio.math.input 1
scoreboard players set #full_input itemio.math.input 0

""".replace("XXX",str(i))
	with open(str(i)+"/if_item/sup/fill.mcfunction","w") as f:
		f.write(if_item_sup_fill)
	

