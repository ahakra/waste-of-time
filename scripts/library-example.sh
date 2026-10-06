#!/bin/bash

# Load the library from the same directory as this script.
source "$(dirname "${BASH_SOURCE[0]}")/my-library.sh"

say_hello "Ali"
add 3 4
