scoreboard players set #filter.valid_item itemio.io 0

# filter.ctc is a list of {id, from}, an entry without id matches every item of its source
execute
    if data storage itemio:io item.components."minecraft:custom_data".ctc.from
    run function itemio:impl/filters/ctc/source with storage itemio:io item.components."minecraft:custom_data".ctc
execute if score #filter.valid_item itemio.io matches 1 run return 1

# a partial list match tests if the ctc of the item is in the list
execute
    if data storage itemio:io item.components."minecraft:custom_data".ctc.id
    if data storage itemio:io item.components."minecraft:custom_data".ctc.from
    run function itemio:impl/filters/ctc/match with storage itemio:io item.components."minecraft:custom_data".ctc

function itemio:impl/filters/ctc/source:
    # the entries of this source, and the ones of this source with an id
    $execute store result score #ctc_source itemio.math if data storage itemio:io filter.ctc[{from:"$(from)"}]
    $execute store result score #ctc_source_id itemio.math if data storage itemio:io filter.ctc[{from:"$(from)"}].id
    execute if score #ctc_source itemio.math > #ctc_source_id itemio.math run scoreboard players set #filter.valid_item itemio.io 1

function itemio:impl/filters/ctc/match:
    $execute if data storage itemio:io filter{ctc:[{id:"$(id)",from:"$(from)"}]} run scoreboard players set #filter.valid_item itemio.io 1
