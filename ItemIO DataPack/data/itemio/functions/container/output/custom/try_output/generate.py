import os


for i in range(3*9):
    try:
        os.mkdir(str(i))
    except:
        pass
    test_nbt="""data remove storage itemio:main.output Item1
data remove storage itemio:main.output Item2


data modify storage itemio:main.output Item1 set from storage itemio:main.output input
data modify storage itemio:main.output Item2 set from storage itemio:main.output Items[{Slot:XXXb}]
data remove storage itemio:main.output Item1.Count
data remove storage itemio:main.output Item1.Slot
data remove storage itemio:main.output Item2.Count
data remove storage itemio:main.output Item2.Slot

execute store result score #!same_item itemio.math.output run data modify storage itemio:main.output Item1 set from storage itemio:main.output Item2
execute if score #!same_item itemio.math.output matches 0 run function itemio:container/output/custom/try_output/XXX/output
""".replace("XXX",str(i))
    with open(str(i)+"/test_nbt.mcfunction","w") as f:
        f.write(test_nbt)
    


    output="""

scoreboard players set #success_output itemio.math.output 1

data modify storage itemio:io output set from storage itemio:main.output Items[{Slot:XXXb}]

#check maxcount
execute store result score #test_count_output itemio.math.output run data get storage itemio:io output.Count
execute if score #test_count_output itemio.math.output > #max_output_count itemio.math.output store result storage itemio:io output.Count int 1 run scoreboard players get #max_output_count itemio.math.output

execute if score #try_input_after itemio.math.output matches 0 run item modify block ~ ~ ~ container.XXX itemio:output/remove_count
execute if score #try_input_after itemio.math.output matches 1 run function itemio:container/output/custom/try_output/XXX/try_input_after
""".replace("XXX",str(i))
    with open(str(i)+"/output.mcfunction","w") as f:
        f.write(output)

    test_filter="""scoreboard players set #valid_item itemio.math.output 0
data modify storage itemio:io item set from storage itemio:main.output Items[{Slot:XXXb}]
function #itemio:event/filter
execute if score #valid_item itemio.math.output matches 1 run function itemio:container/output/custom/try_output/XXX/output





""".replace("XXX",str(i))
    with open(str(i)+"/test_filter.mcfunction","w") as f:
        f.write(test_filter)




    try_input_after="""

data modify storage itemio:io input set from storage itemio:io output
execute at 00000001-792c-4877-9654-b8805ab5f8d7 run function #itemio:calls/input

execute if score #success_input itemio.math.input matches 1 run item modify block ~ ~ ~ container.XXX itemio:input/remove_count_origin
execute if score #success_input itemio.math.input matches 1 run scoreboard players set #success_transfer itemio.math 1
execute if score #success_input itemio.math.input matches 0 run scoreboard players set #success_output itemio.math.output 0
""".replace("XXX",str(i))
    with open(str(i)+"/try_input_after.mcfunction","w") as f:
        f.write(try_input_after)
    print("execute if score #slot_output itemio.math.output matches XXX if data storage itemio:main.output Items[{Slot:XXXb}] run function itemio:container/output/custom/try_output/XXX/test_nbt".replace("XXX",str(i)))


