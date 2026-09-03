use clap::Args;

#[derive(Args, Debug)]
pub struct QueryArgs {
    #[arg(short, long)]
    pub query: String,
}
impl QueryArgs {
    pub fn run(&self) {
        println!("Querying {}", self.query);
    }
}