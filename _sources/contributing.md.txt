# 🤝 Contributing
Contributions are always welcome!

All the project is using Poetry for dependency management. 


## Installation

Install the project using [poetry](https://python-poetry.org/).

It use [poetry](https://python-poetry.org/) to manage the dependencies.

```bash
$ git clone https://github.com/edayot/ItemIO.git
$ cd ItemIO
$ poetry install
```

## Datapack
The datapack is compiled using the [beet](https://mcbeet.dev).

```bash
$ make watch # Compile the datapack on file change
```


## Documentation

The documentation is built using [Sphinx](https://www.sphinx-doc.org/en/master/). 

This script will host a live server on http://localhost:8000/.
```bash
$ cd docs/
$ make livehtml
```

The documentaion use the [bolt](https://github.com/mcbeet/bolt) format for mcfunction. That allow for multiline commands & nested commands.

The parser also support the [SNBT](https://minecraft.wiki/w/NBT_format#SNBT_format) format for syntax highlighting.

