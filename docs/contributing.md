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
# Build the datapack
$ make b BUILD_TYPE=release

# Build the datapack in live mode
$ make watch
```

:::{admonition} Env variables
:class: seealso
Can be pass or set in the `.env` file.
- `BUILD_TYPE` : `release` or `debug` (optional)
- `MINECRAFT_FOLDER` : The path to the minecraft folder (required for watch)
- `SAVE_FOLDER` : The path to the save folder (required for watch)
- `DATAPACKS_FOLDER` : The path to the datapacks folder (required for watch)
- `RESOURCES_PACK_FOLDER` : The path to the resourcepacks folder (required for watch)

Example :
```bash
MINECRAFT_FOLDER = /mnt/c/Users/erwan/AppData/Roaming/PrismLauncher/instances/Simply\ Optimized\(1\)/.minecraft/
SAVE_FOLDER = $(MINECRAFT_FOLDER)saves/Datapack\ island/
DATAPACKS_FOLDER = $(SAVE_FOLDER)datapacks/
RESOURCES_PACK_FOLDER = $(MINECRAFT_FOLDER)resourcepacks/
```

:::


## Documentation

The documentation is built using [Sphinx](https://www.sphinx-doc.org/en/master/). 

This script will host a live server on http://localhost:8000/.
```bash
$ cd docs/
$ make livehtml
```

The documentaion use the [bolt](https://github.com/mcbeet/bolt) format for mcfunction. That allow for multiline commands & nested commands.

The parser also support the [SNBT](https://minecraft.wiki/w/NBT_format#SNBT_format) format for syntax highlighting.

