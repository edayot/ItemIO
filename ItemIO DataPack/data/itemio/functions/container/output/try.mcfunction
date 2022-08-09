execute store result score #slot itemio.math run data get storage itemio:main ioconfig[0].Slot

execute if score #slot itemio.math matches 0 if data storage itemio:main Items[{Slot:0b}] run function itemio:container/output/try/0
