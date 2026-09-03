use clap::Parser;

use crate::commands::Command;

#[derive(Parser, Debug)]
#[command(name = "wasteoftime", version, about = "My waste time tool")]
pub struct Cli {
    #[command(subcommand)]
    pub command: Command,
}
