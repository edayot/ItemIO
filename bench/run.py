"""Run the ItemIO stopwatch benchmarks and aggregate their results.

Usage:
    uv run python bench/run.py                         # run, print the table
    uv run python bench/run.py --save baseline-1.8.1   # also write bench/results/<name>.json
    uv run python bench/run.py --compare baseline-1.8.1

The benchmarks are ward tests in bench/datapack (built with beet-bench.yaml).
Each round prints `ITEMIO_BENCH <name> <round> <elapsed_us> <n>` with /say,
which this script reads back from the test server log.
"""

import argparse
import json
import re
import statistics
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
RESULTS = ROOT / "bench" / "results"
LINE = re.compile(r"ITEMIO_BENCH (\S+) (\d+) (\d+) (\d+)")


def server_log(version: str) -> Path:
    return Path.home() / ".cache" / "mcward" / "environments" / version / "logs" / "latest.log"


def read_new_lines(log: Path, offset: int) -> list[str]:
    if not log.exists():
        return []
    text = log.read_text(errors="replace")
    # the server restarts between runs, so the log may have been rotated
    if len(text) < offset:
        offset = 0
    return text[offset:].splitlines()


def run_benchmarks(version: str, selector: str) -> list[str]:
    log = server_log(version)
    offset = len(log.read_text(errors="replace")) if log.exists() else 0
    command = ["uv", "run", "beet", "-p", "beet-bench.yaml", "test", "-v", version, selector]
    process = subprocess.run(command, cwd=ROOT)
    if process.returncode != 0:
        sys.exit("Benchmark run failed (a benchmark sanity assert or the build failed)")
    return read_new_lines(log, offset)


def aggregate(lines: list[str]) -> dict[str, dict]:
    rounds: dict[str, list[tuple[int, int]]] = {}
    for line in lines:
        if match := LINE.search(line):
            name, _, elapsed_us, n = match.groups()
            rounds.setdefault(name, []).append((int(elapsed_us), int(n)))

    results = {}
    for name, values in sorted(rounds.items()):
        per_op = [elapsed / n for elapsed, n in values]
        results[name] = {
            "n": values[0][1],
            "rounds": len(values),
            "round_ms": [elapsed / 1000 for elapsed, _ in values],
            "median_us_per_op": statistics.median(per_op),
            "min_us_per_op": min(per_op),
        }
    return results


def print_table(results: dict[str, dict], reference: dict[str, dict] | None):
    header = "| benchmark | n | median µs/op | min µs/op |"
    separator = "| --- | ---: | ---: | ---: |"
    if reference:
        header += " reference µs/op | speedup |"
        separator += " ---: | ---: |"
    print(header)
    print(separator)
    for name, result in results.items():
        row = f"| {name} | {result['n']} | {result['median_us_per_op']:.1f} | {result['min_us_per_op']:.1f} |"
        if reference:
            if name in reference:
                before = reference[name]["median_us_per_op"]
                after = result["median_us_per_op"]
                speedup = f"x{before / after:.2f}" if after else "∞"
                row += f" {before:.1f} | {speedup} |"
            else:
                row += " - | - |"
        print(row)


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--version", default="26.3", help="Minecraft version to run on")
    parser.add_argument("--selector", default="itemio_test:bench/*", help="ward test selector")
    parser.add_argument("--save", metavar="NAME", help="write the results to bench/results/NAME.json")
    parser.add_argument("--compare", metavar="NAME", help="compare with bench/results/NAME.json")
    parser.add_argument("--log", type=Path, help="parse an existing server log instead of running")
    args = parser.parse_args()

    lines = args.log.read_text(errors="replace").splitlines() if args.log else run_benchmarks(args.version, args.selector)
    results = aggregate(lines)
    if not results:
        sys.exit("No ITEMIO_BENCH line found in the server log")

    reference = None
    if args.compare:
        reference = json.loads((RESULTS / f"{args.compare}.json").read_text())["results"]
    print_table(results, reference)

    if args.save:
        RESULTS.mkdir(parents=True, exist_ok=True)
        commit = subprocess.run(["git", "rev-parse", "--short", "HEAD"], cwd=ROOT, capture_output=True, text=True).stdout.strip()
        payload = {
            "name": args.save,
            "date": datetime.now(timezone.utc).isoformat(timespec="seconds"),
            "commit": commit,
            "minecraft": args.version,
            "results": results,
        }
        (RESULTS / f"{args.save}.json").write_text(json.dumps(payload, indent=2) + "\n")
        print(f"\nSaved bench/results/{args.save}.json")


if __name__ == "__main__":
    main()
