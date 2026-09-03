use clap::Args;

#[derive(Args, Debug)]
pub struct IngestArgs {
    #[arg(short, long)]
    pub input: String,
}
impl IngestArgs {
    pub fn run(&self) {
        println!("Ingesting {}", self.input);
    }
}