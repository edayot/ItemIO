#$say $(item)

$item replace block -30000000 23 1610 container.0 with $(item)
item modify block -30000000 23 1610 container.0 itemio:v0.7.0/internal/input/add_count

execute store result score #temp itemio.math run data get block -30000000 23 1610 Items[0].Count 

$execute if score #temp itemio.math matches 1 run data modify storage itemio:main temp.result1 set value '$(result1)"$(item)",'
$execute if score #temp itemio.math matches 16 run data modify storage itemio:main temp.result16 set value '$(result16)"$(item)",'
