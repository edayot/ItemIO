


data modify storage itemio:main.input args_delete.slot set from storage itemio:main.input disabled_slots[0]

function itemio:impl/container/input/vanilla_custom/crafter/delete_disabled/real_delete with storage itemio:main.input args_delete



data remove storage itemio:main.input disabled_slots[0]
execute if data storage itemio:main.input disabled_slots[0] run function itemio:impl/container/input/vanilla_custom/crafter/delete_disabled






