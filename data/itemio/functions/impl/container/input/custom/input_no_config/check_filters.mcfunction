
data modify storage itemio:io filters set from storage itemio:main.input slot.filters
data modify storage itemio:io item set from storage itemio:main.input input

function itemio:impl/filters/calls/main

scoreboard players operation #slot_valid itemio.math.input = #filters.valid_item itemio.io
