use clap::Args;

use crate::commands::CommandResult;

#[derive(Args, Debug)]
pub struct QueryArgs {
    #[arg(short, long)]
    pub query: String,
}
impl QueryArgs {
    pub fn run(&self) -> CommandResult {
        println!("Querying {}", self.query);
        Ok(())
    }
}
