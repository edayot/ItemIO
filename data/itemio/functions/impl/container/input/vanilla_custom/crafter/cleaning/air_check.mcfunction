data remove storage itemio:main.input temp.item_crafter
data modify storage itemio:main.input temp.item_crafter set value {id:"do_not_useFDSDFS"}
$data modify storage itemio:main.input temp.item_crafter set from storage itemio:main.input Items[{Slot:$(slot_clean)b}]


$execute if data storage itemio:main.input temp.item_crafter{id:"do_not_useFDSDFS"} run data modify storage itemio:main.input Items_clean append value {id:"do_not_useFDSDFS",Slot:$(slot_clean)b,count:0}
$execute unless data storage itemio:main.input temp.item_crafter{id:"do_not_useFDSDFS"} run function itemio:impl/container/input/vanilla_custom/crafter/cleaning/nbt_check {slot_clean:$(slot_clean)}

