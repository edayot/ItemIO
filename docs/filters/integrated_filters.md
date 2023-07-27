# Intergrated Filters


## Minecraft ID
A filter that check if the item is a minecraft item.

### Example :
```SNBT
{
    id: ["minecraft:crafting_table", "minecraft:barrel", "minecraft:iron_nugget"]
}
```
This filter will check if the item is a crafting table or a barrel or an iron nugget.

## Energy
A filter that check if the item is an energy item. 

The way to define an energy item if documented in the [DatapackEnergy](https://github.com/ICY105/DatapackEnergy#nbt-format)

### Example :
```SNBT
{
    energy: 1b
}
```

## CTC (Common Traits Convention)
A filter that check if the item as a CTC.

### Example :
```SNBT
{
    ctc: [
        {id:"drawer",from:"airdox_:simpledrawer"},
        {id:"new_drawer",from:"airdox_:simpledrawer"},
    ]
}
```
Here it will check if the item is a drawer from [SimpleDrawer](https://githuc.com/edayot/SimpleDrawer) (the legacy and 1.20 one).

## Smithed ID (Smithed Convention)
WIP