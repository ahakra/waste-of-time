mod ingest;
mod inspect;
mod query;

pub use ingest::IngestArgs;
pub use inspect::InspectArgs;
pub use query::QueryArgs;

use clap::Subcommand;

#[derive(Subcommand, Debug)]
pub enum Command {
    Ingest(IngestArgs),
    Inspect(InspectArgs),
    Query(QueryArgs)
}
impl  Command {
    pub fn run(&self){
         match &self {
            Command::Ingest(args) => args.run(),
            Command::Inspect(args) => args.run(),
            Command::Query(args) => args.run(),
        }
    }
   
}