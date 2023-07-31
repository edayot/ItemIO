# 📚 Data Types


## Filter
Filter are dict that are ANDed together.
Here is the format of a filter (nothing is required) :

```ts
{
    id: string[]
    ctc: string[]
    energy: bool
}
```
Custom ones are also supported !


## Filters
Filters are a list of filters that are ORed together.

Here is the format of a filters (nothing is required) :

```ts
Filter[]
```

