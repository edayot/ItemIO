# 🤝 Contributing
Contributions are always welcome!

All the project is using uv for dependency management. 


## Installation

Install the project using [uv](https://docs.astral.sh/uv/).

It use [uv](https://docs.astral.sh/uv/) to manage the dependencies.

```bash
$ git clone https://github.com/edayot/ItemIO.git
$ cd ItemIO
$ uv sync --group dev
```

## Datapack
The datapack is compiled using the [beet](https://mcbeet.dev).

```bash
# Build the datapack
$ uv run beet

# Build the datapack in live mode
$ uv run beet watch
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

