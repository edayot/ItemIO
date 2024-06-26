# 💻 Integrated Filters


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

A filter that check if the item as smithed id.

### Format :
```ts
{
    smithed:{
        id: string[],
    }
}
```
Theses are part from smithed convention ID, the filter will match any of the ids.


## Merge Filter
A filter that make a copy of the item, merge it with the filter and compare it with the original item.

### Format :
```ts
{
    merge: dict,
}
```

### Example :
```SNBT
{
    merge: {
        display: {}
    }
}
```
This filter will check if the item as a display tag. 

```{admonition} Note 
:class: note
This filter will not work with list, in the merge process there are replaced.
```

## Minecraft Tags
All the minecraft tags are available as filters.

The full list is available [here](https://github.com/misode/mcmeta/tree/registries/tag/item)

### Example :
```SNBT
{
    minecraft:{
        bookshelf_books: 1b
    }
}
```


This filter will check if the item is a book that can be placed in a chiseled bookshelf.



## Items predicate

A filter that check if the item match a predicate.

It's only a 24w12a+ feature.

### Format :
```ts
{
    item_predicate: string,
}
```

In implementation, this use this command :
```mcfunction
execute if items entity @s weapon <item_predicate> run ...
```