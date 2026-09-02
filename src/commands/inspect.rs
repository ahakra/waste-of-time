use clap::Args;

#[derive(Args, Debug)]
pub struct InspectArgs {
    /// Show detailed information.
    #[arg(short, long)]
    pub verbose: bool,
}
