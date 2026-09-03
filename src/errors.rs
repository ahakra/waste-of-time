use std::io;

use thiserror::Error;
#[derive(Error, Debug)]
pub enum CommandError {
    #[error("failed to access file: {0}")]
    Io(#[from] io::Error),
}
