use clap::Args;
use std::fs::File;

use crate::commands::CommandResult;

#[derive(Args, Debug)]
pub struct IngestArgs {
    #[arg(short, long)]
    pub input: String,
}
impl IngestArgs {
    pub fn run(&self) -> CommandResult {
        let _ingest_file = File::open(&self.input)?;

        println!("Ingesting {}", self.input);

        Ok(())
    }
}
