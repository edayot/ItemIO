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

An entry without ``id`` matches every item of its source :
```SNBT
{
    ctc: [
        {from:"airdox_:simpledrawer"},
    ]
}
```
Here it will check if the item is any item from SimpleDrawer.

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
        components: {"minecraft:custom_data": {energy: {}}}
    }
}
```
This filter will check if the item as an energy custom data. 

```{admonition} Note 
:class: note
This filter will not work with list, in the merge process there are replaced.
```

## Minecraft Tags

:::{admonition} Deprecated
:class: warning
This filter is slow (every tag of the game is tested), use an [item predicate](#items-predicate) instead :
``{item_predicate: "#minecraft:bookshelf_books"}``
:::

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

### Format :
```ts
{
    item_predicate: string,
}
```

In implementation, this use this command :
```mcfunction
execute if items entity @s contents <item_predicate> run ...
```

### Example :
```SNBT
{
    item_predicate: "#minecraft:bookshelf_books"
}
```