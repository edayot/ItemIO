
function ./ioconfig_storage:
    $data modify storage itemio:main.input ioconfig set from storage $(storage)


#loading ioconfig
data remove storage itemio:main.input ioconfig 

data modify storage itemio:main.input ioconfig_type set value "entity"
execute 
    if entity @s[type=marker] 
    run function ./input_marker:
        data modify storage itemio:main.input ioconfig_type set from entity @s data.itemio.ioconfig_type
        data modify storage itemio:main.input ioconfig set from entity @s data.itemio.ioconfig
        execute if data storage itemio:main.input {ioconfig_type:"storage"} run function ./input_storage with storage itemio:main.input ioconfig

execute
    if entity @s[type=#itemio:item_frames] 
    run function ./input_itemframe:
        data modify storage itemio:main.input ioconfig_type set from entity @s item.tag.itemio.ioconfig_type
        data modify storage itemio:main.input ioconfig set from entity @s item.tag.itemio.ioconfig
        execute if data storage itemio:main.input {ioconfig_type:"storage"} run function ./input_storage with storage itemio:main.input ioconfig


execute
    if entity @s[type=armor_stand] 
    run function ./input_armorstand:
        data modify storage itemio:main.input ioconfig_type set from entity @s Item.tag.itemio.ioconfig_type
        data modify storage itemio:main.input ioconfig set from entity @s Item.tag.itemio.ioconfig
        execute if data storage itemio:main.input {ioconfig_type:"storage"} run function ./input_storage with storage itemio:main.input ioconfig
    
execute
    if entity @s[type=#itemio:item_display] 
    run function ./input_itemdisplay:
        data modify storage itemio:main.input ioconfig_type set from entity @s item.tag.itemio.ioconfig_type
        data modify storage itemio:main.input ioconfig set from entity @s item.tag.itemio.ioconfig
        execute if data storage itemio:main.input {ioconfig_type:"storage"} run function ./input_storage with storage itemio:main.input ioconfig

data remove storage itemio:main.input ioconfig[{mode:"output"}]

execute if data storage itemio:main.input ioconfig if data storage itemio:io input run function itemio:impl/container/input/custom/input_noconfig
