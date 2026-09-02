# Rust Concepts

## Using `clap` for a command-line interface

`clap` is a good choice for this project because it is a mature Rust CLI library
that provides argument parsing, validation, generated help, and subcommands. Its
derive API also keeps the CLI definition close to ordinary Rust types.

The dependency enables the derive feature:

```toml
clap = { version = "4.6.6", features = ["derive"] }
```

## Parser, commands, and arguments

The top-level CLI derives `Parser`:

```rust
#[derive(Parser, Debug)]
pub struct Cli {
    #[command(subcommand)]
    pub command: Command,
}
```

`Cli::parse()` reads the process arguments and produces a `Cli` value. The
`command` field contains the subcommand selected by the user.

The command enum derives `Subcommand`:

```rust
#[derive(Subcommand, Debug)]
pub enum Command {
    Ingest(IngestArgs),
    Inspect(InspectArgs),
    Query(QueryArgs),
}
```

Each variant represents one command. A variant can contain a struct with the
arguments specific to that command. Those structs derive `Args`:

```rust
#[derive(Args, Debug)]
pub struct IngestArgs {
    #[arg(short, long)]
    pub input: String,
}
```

This supports both `-i data/sample.csv` and
`--input data/sample.csv`.

## Dispatching a command

After parsing, pattern matching selects the behavior:

```rust
match cli.command {
    Command::Ingest(args) => println!("Ingesting {}", args.input),
    Command::Inspect(args) => println!("Inspecting (verbose: {})", args.verbose),
    Command::Query(args) => println!("Querying {}", args.query),
}
```

The next step is to move real behavior into command functions and have those
functions return `Result`. For filesystem work, a function can borrow a `&Path`
instead of taking ownership of the argument's `String`.

## Module lesson

Rust does not compile every `.rs` file automatically. Modules must be declared
from the crate root or another connected module. In this project, `main.rs`
declares `cli` and `commands`, while `commands/mod.rs` declares each individual
command module.

