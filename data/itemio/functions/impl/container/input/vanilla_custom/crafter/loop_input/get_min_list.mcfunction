data modify storage itemio:main.input Items_min_count set value []
$data modify storage itemio:main.input Items_min_count append from storage itemio:main.input Items_clean[{count:$(count)}]
