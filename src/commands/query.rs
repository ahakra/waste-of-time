use clap::Args;

#[derive(Args, Debug)]
pub struct QueryArgs {
    #[arg(short, long)]
    pub query: String,
}
