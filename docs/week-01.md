# Week 1: Engineering Shell and Rust CLI

## Goal

The goal for Week 1 is to build a small but disciplined Rust application shell.
The application should expose a command-line interface, return meaningful exit
codes, work through repeatable Make targets, and leave useful troubleshooting
evidence in the repository.

## Current progress

I chose the `clap` crate to build the CLI. The `derive` feature lets the command
shape be described with Rust structs and enums while `clap` generates argument
parsing, validation, and help output.

The current CLI contains these subcommands:

- `ingest`, which accepts an input path
- `inspect`, which accepts a verbose flag
- `query`, which accepts a query string

Examples:

```bash
cargo run -- --help
cargo run -- ingest --input data/sample.csv
cargo run -- inspect --verbose
cargo run -- query --query "example"
```

The CLI is organized as follows:

- `src/cli.rs` defines the top-level parser.
- `src/commands/mod.rs` defines the available subcommands.
- Each file under `src/commands/` defines the arguments for one subcommand.
- `src/main.rs` parses the arguments and dispatches the selected command.

## Evidence

The following behavior has been verified:

- `cargo run -- --help` succeeds with exit code `0`.
- A valid subcommand is parsed and dispatched.
- An unknown subcommand is rejected by `clap` with exit code `2`.

## Next steps

- Add the `bench` placeholder subcommand.
- Validate that the ingest input path exists.
- Print the input path and file size.
- Return errors with `Result` instead of treating missing input as success.
- Send normal output to stdout and diagnostics to stderr.
- Add automated tests and complete the required Make targets.

