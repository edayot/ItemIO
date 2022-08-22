# These are example of integrated filter
# Remember : Do not modify any of the input data 


execute if score itemio.major load.status matches 0 if score itemio.minor load.status matches 0 if score itemio.patch load.status matches 1.. run function itemio:v0.0.1/container/integrated_filters/repart

