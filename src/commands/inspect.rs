use clap::Args;

#[derive(Args, Debug)]
pub struct InspectArgs {
    /// Show detailed information.
    #[arg(short, long)]
    pub verbose: bool,
}
impl InspectArgs {
    pub fn run(&self) {
        println!("Inspecting (verbose: {})", self.verbose);
    }
}