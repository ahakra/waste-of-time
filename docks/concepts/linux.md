# Linux and Workflow Concepts

## Using Make as the workflow interface

GNU Make is not specific to Rust, but it is commonly available in Linux and
Unix-like development environments. I am using a `Makefile` as a short,
repeatable interface for project commands.

The current workflow includes:

```bash
make run
```

which runs:

```bash
cargo run
```

This creates a simple workflow boundary:

```text
human -> Makefile -> Cargo -> Rust application
```

Cargo remains responsible for building and testing Rust. Make provides stable
project-level commands that can later combine Cargo, shell scripts, logging, and
input files without requiring users to remember every underlying command.

The Week 1 Makefile still needs targets for `help`, `setup`, `fmt`, `lint`,
`test`, `check`, `run`, `clean`, `bench`, and `logs`.

## Exit status

Linux processes return an exit status. The shell exposes the most recent status
through `$?`:

```bash
cargo run -- --help
echo $?
```

An exit code of `0` means success. A non-zero value means failure. This contract
allows Make, Bash scripts, and pipelines to stop when the Rust application
fails.

## stdout and stderr

Normal command output is written to stdout, while diagnostics should be written
to stderr. The streams can be redirected independently:

```bash
command >output.txt
command 2>error.txt
```

Keeping these streams separate makes normal output safe to pipe into another
tool while errors remain visible or can be logged independently.

## Make target caution

The current `push` target stages every change with `git add .`, creates a commit,
and pushes it. It should be used carefully because generated or unrelated files
could be included. Checking `git status` before committing keeps the repository
history intentional.
