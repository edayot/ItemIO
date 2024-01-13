
data modify storage itemio:main temp.chiseled_bookshelf_items set from block ~ ~ ~ Items

possible_facing = ["north", "south", "east", "west"]



data modify storage itemio:main temp.chiseled_bookshelf_args set value ""

for face in possible_facing:
    function_name = f"itemio:impl/container/chiseled_bookshelf/{face}"
    function_name_retrieve = f"itemio:impl/container/chiseled_bookshelf/{face}_retrieve"
    raw f"execute if block ~ ~ ~ minecraft:chiseled_bookshelf[facing={face}] run function {function_name}"

    function function_name_retrieve:
        raw f"$setblock ~ ~ ~ minecraft:chiseled_bookshelf[$(chiseled_bookshelf_args)facing={face}]"


    function function_name:
        for slot in range(6):
            function_name_slot = f"{function_name}/slot_{slot}"

            function function_name_slot:
                #raw f"$say {slot}, {face}, $(chiseled_bookshelf_args)"
                raw f"execute store success score #ifitem_{slot} itemio.math if data block ~ ~ ~ Items[{{Slot:{slot}b}}]"
                raw f'$execute if score #ifitem_{slot} itemio.math matches 0 run data modify storage itemio:main temp.chiseled_bookshelf_args set value "slot_{slot}_occupied=false,$(chiseled_bookshelf_args)"'
                raw f'$execute if score #ifitem_{slot} itemio.math matches 1 run data modify storage itemio:main temp.chiseled_bookshelf_args set value "slot_{slot}_occupied=true,$(chiseled_bookshelf_args)"'
            
            function function_name_slot with storage itemio:main temp
        
        function function_name_retrieve with storage itemio:main temp
        
    

        

        
        

            







data modify block ~ ~ ~ Items set from storage itemio:main temp.chiseled_bookshelf_items








