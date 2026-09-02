mod cli;
mod commands;

use clap::Parser;
use cli::Cli;
use commands::Command;

fn main() {
    let cli = Cli::parse();

    match cli.command {
        Command::Ingest(args) => println!("Ingesting {}", args.input),
        Command::Inspect(args) => println!("Inspecting (verbose: {})", args.verbose),
        Command::Query(args) => println!("Querying {}", args.query),
    }
}
