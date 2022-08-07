
for i in range(2):
    repart="""
    execute store success score #if_item itemio.math if data storage itemio:main Items[{Slot:XXXb}]
execute if score #if_item itemio.math matches 0 run function itemio:working/custom/try_input/XXX/unless_item
execute if score #if_item itemio.math matches 1 run function itemio:working/custom/try_input/XXX/if_item

    """.replace("XXX",str(i))
    with open(str(i)+"/repart.mcfunction","w") as f:
        f.write(repart)
    
    unless_item=""""""