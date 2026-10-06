#!/bin/bash

# Use the supplied filename, or the sample beside this script.
log_file="${1:-$(dirname "${BASH_SOURCE[0]}")/sample.log}"

if [ ! -f "$log_file" ] || [ ! -r "$log_file" ]; then
    echo "Cannot read log file: $log_file" >&2
    exit 1
fi

echo "${BASH_SOURCE[0]}"
# Each line has four columns separated by |:
# 1 = timestamp, 2 = level, 3 = user, 4 = message
# -d chooses the separator; -f chooses the columns to extract.
grep '|ERROR|' "$log_file" | cut -d '|' -f 2,3,4