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


## Testing
The tests are run using [ward](https://github.com/mcbookshelf/ward/). It handle tests and coverage.

Everything used only by the tests (tests, structures, helpers) is in the ``itemio_test`` namespace,
which is removed from the release builds (``-s meta.airdox_.release=true``, see ``airdox_.remove_test_namespace``).

```bash
# Run the tests
uv run beet test

# With coverage
uv run beet test --coverage --coverage-report html
```

## Benchmarks

Performance is measured with the `/stopwatch` command, in ward tests that live outside the
normal test suite (`bench/datapack`, built with `beet-bench.yaml`). Each benchmark runs an
operation `n` times per round, reports one line per round in the server log, and asserts the
final state so that a benchmark doing less work fails instead of looking faster.

```bash
# Run the benchmarks
uv run python bench/run.py

# Compare with a saved run, and save the new one
uv run python bench/run.py --compare baseline-1.8.1 --save my-change

# Design prototypes (not part of the comparison)
uv run python bench/run.py --selector 'itemio_test:proto/*'
```

Results are stored in `bench/results/`. The stopwatch has a millisecond resolution and the
run-to-run noise is around ±10 %, so only compare medians and ignore small differences.
