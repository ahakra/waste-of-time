use clap::Args;

#[derive(Args, Debug)]
pub struct IngestArgs {
    #[arg(short, long)]
    pub input: String,
}
