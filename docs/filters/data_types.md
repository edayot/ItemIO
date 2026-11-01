# 📚 Data Types


## Filter
Filter are dict that are ANDed together.
Here is the format of a filter (nothing is required) :

```ts
{
    id: string[]
    ctc: {id: string, from: string}[]
    smithed: {id: string[]}
    energy: bool
    merge: dict
    item_predicate: string
    minecraft: {[item_tag: string]: 1b} // deprecated, use item_predicate
}
```
See [Integrated Filters](https://edayot.github.io/ItemIO/filters/integrated_filters.html).
Custom ones are also supported !


## Filters
Filters are a list of filters that are ORed together.

Here is the format of a filters (nothing is required) :

```ts
Filter[]
```

