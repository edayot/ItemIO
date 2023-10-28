
function ./ioconfig_storage:
    $data modify storage itemio:main.output ioconfig set from storage $(storage)


#loading ioconfig
data remove storage itemio:main.output ioconfig 

data modify storage itemio:main.output ioconfig_type set value "entity"
execute 
    if entity @s[type=marker] 
    run function ./input_marker:
        data modify storage itemio:main.output ioconfig_type set from entity @s data.itemio.ioconfig_type
        data modify storage itemio:main.output ioconfig set from entity @s data.itemio.ioconfig
        execute if data storage itemio:main.output {ioconfig_type:"storage"} run function ./output_storage with storage itemio:main.output ioconfig

execute
    if entity @s[type=#itemio:item_frames] 
    run function ./input_itemframe:
        data modify storage itemio:main.output ioconfig_type set from entity @s item.tag.itemio.ioconfig_type
        data modify storage itemio:main.output ioconfig set from entity @s item.tag.itemio.ioconfig
        execute if data storage itemio:main.output {ioconfig_type:"storage"} run function ./output_storage with storage itemio:main.output ioconfig


execute
    if entity @s[type=armor_stand] 
    run function ./input_armorstand:
        data modify storage itemio:main.output ioconfig_type set from entity @s Item.tag.itemio.ioconfig_type
        data modify storage itemio:main.output ioconfig set from entity @s Item.tag.itemio.ioconfig
        execute if data storage itemio:main.output {ioconfig_type:"storage"} run function ./output_storage with storage itemio:main.output ioconfig
    
execute
    if entity @s[type=#itemio:item_display] 
    run function ./input_itemdisplay:
        data modify storage itemio:main.output ioconfig_type set from entity @s item.tag.itemio.ioconfig_type
        data modify storage itemio:main.output ioconfig set from entity @s item.tag.itemio.ioconfig
        execute if data storage itemio:main.output {ioconfig_type:"storage"} run function ./output_storage with storage itemio:main.output ioconfig

data remove storage itemio:main.output ioconfig[{mode:"input"}]

execute if data storage itemio:main.output ioconfig run function itemio:impl/container/output/custom/output_noconfig
