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
    Query(QueryArgs),
}
