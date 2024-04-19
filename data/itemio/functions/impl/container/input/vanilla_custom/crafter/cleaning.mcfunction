



$function itemio:impl/container/input/vanilla_custom/crafter/cleaning/air_check {slot_clean:$(slot_clean)}





scoreboard players add #slot_clean itemio.math.input 1
execute 
    store result storage itemio:main.input args.slot_clean int 1 
    run scoreboard players get #slot_clean itemio.math.input

execute
    unless score #slot_clean itemio.math.input matches 9..
    run function itemio:impl/container/input/vanilla_custom/crafter/cleaning with storage itemio:main.input args