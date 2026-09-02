# Troubleshooting Journal

This file records real failures encountered while building the project. An
incident should include the command, expected behavior, actual behavior, exit
code, diagnosis, fix, and lesson learned. stdout and stderr should be recorded
separately when that distinction matters.

## Incident: CLI modules were not compiled

### Command

```bash
cargo check
```

### Expected behavior

Cargo should compile and validate the CLI types under `src/commands/`.

### Actual behavior

`cargo check` succeeded even though the CLI files were missing required imports
and derives.

### Diagnosis

Rust only compiles modules connected to the crate's module tree. The files
existed on disk, but `main.rs` did not declare `mod cli;` and `mod commands;`, so
they were not part of the crate.

### Fix

The modules were connected from `main.rs`, the command directory received a
`mod.rs`, and the required `clap` derives and imports were added. `main.rs` now
parses and dispatches the selected command.

### Lesson

A file existing under `src/` does not automatically make it part of a Rust
crate. A successful build only validates modules reachable from the crate root.

## Incident: Missing ingest input returns success

### Command

```bash
cargo run -- ingest --input data/does-not-exist.csv
echo $?
```

### Expected behavior

The command should print a clear diagnostic to stderr and return a non-zero exit
code.

### Actual behavior

stdout contains:

```text
Ingesting data/does-not-exist.csv
```

The command returns exit code `0` and produces no application error on stderr.

### Diagnosis

The `ingest` branch currently prints the supplied string without checking the
filesystem. Argument parsing proves that a value was supplied, but it does not
prove that the path exists or is readable.

### Planned fix

Move ingest behavior into a function that accepts a borrowed path, reads its
metadata, and returns a `Result`. Propagate failures to the boundary in `main`
and report them on stderr with a non-zero status.

### Lesson

Successful argument parsing is different from successful command execution.
Scripts must be able to trust the process exit code.

## Incident template

```text
## Incident: Short description

Command:
Expected behavior:
Actual behavior:
Exit code:
stdout:
stderr:
Diagnosis:
Fix:
Lesson:
```

