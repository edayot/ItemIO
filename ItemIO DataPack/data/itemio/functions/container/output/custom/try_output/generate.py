import os


for i in range(3*9):
    try:
        os.mkdir(str(i))
    except:
        pass
    test_nbt="""data remove storage itemio:main Item1
data remove storage itemio:main Item2


data modify storage itemio:main Item1 set from storage itemio:main input
data modify storage itemio:main Item2 set from storage itemio:main Items[{Slot:XXXb}]
data remove storage itemio:main Item1.Count
data remove storage itemio:main Item1.Slot
data remove storage itemio:main Item2.Count
data remove storage itemio:main Item2.Slot

execute store result score #!same_item itemio.math run data modify storage itemio:main Item1 set from storage itemio:main Item2
execute if score #!same_item itemio.math matches 0 run function itemio:container/output/custom/try_output/XXX/output
""".replace("XXX",str(i))
    with open(str(i)+"/test_nbt.mcfunction","w") as f:
        f.write(test_nbt)
    


    output="""
scoreboard players set #success_output itemio.math 1

data modify storage itemio:io output set from storage itemio:main Items[{Slot:XXXb}]

#check maxcount
execute store result score #test_count_output itemio.math run data get storage itemio:io output.Count
execute if score #test_count_output itemio.math > #max_output_count itemio.math store result storage itemio:io output.Count int 1 run scoreboard players get #max_output_count itemio.math

item modify block ~ ~ ~ container.XXX itemio:output/remove_count

""".replace("XXX",str(i))
    with open(str(i)+"/output.mcfunction","w") as f:
        f.write(output)

    print("execute if score #slot_output itemio.math matches XXX if data storage itemio:main Items[{Slot:XXXb}] run function itemio:container/output/custom/try_output/XXX/test_nbt".replace("XXX",str(i)))



