# 📚 Basic Usage



```mcfunction
# This is a comment

give @s minecraft:stone 1
execute as @s[distance=..5,tag=aaa] at @s run say Hello World!
data modify entity @s Health set value 1b
```