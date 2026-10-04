#!/bin/bash

in_path()
{
    local cmd=$1
    local directory
    local -a directories

    # Split PATH at colons. The extra colon preserves an empty final entry.
    IFS=: read -r -a directories <<< "$2:"

    for directory in "${directories[@]}"
    do
        # An empty PATH entry means the current directory.
        directory=${directory:-.}

        # -f checks for a regular file; -x checks that we can execute it.
        if [ -f "$directory/$cmd" ] && [ -x "$directory/$cmd" ]; then
            echo "Found executable: $directory/$cmd"
            return 0
        fi
    done

    return 1
}

checkForCmdInPath()
{
    local cmd=$1

    # -z checks whether the command name is empty.
    if [ -z "$cmd" ]; then
        echo "Please provide a command name or a path."
        return 1
    fi

    # A slash means this is a path (such as /bin/ls or ./script.sh).
    if [[ "$cmd" == */* ]]; then
        # Reject the path if it is not a regular file OR is not executable.
        if [ ! -f "$cmd" ] || [ ! -x "$cmd" ]; then
            echo "Not an executable file: $cmd"
            return 1
        fi
        echo "Executable file: $cmd"
    # in_path returns 0 when found; ! makes this branch run when not found.
    elif ! in_path "$cmd" "$PATH"; then
        echo "Command not found in PATH: $cmd"
        return 2
    fi

    return 0
}


if [ $# -ne 1 ]; then
    echo "usage: $0 command" >&2
    exit 1
fi
# Use the first argument, or check for bash when no argument is supplied.
checkForCmdInPath "${1-bash}"

case $? in 
    0 ) echo "$1 found in PATH"                 ;;
    1 ) echo "$1 not found or not executable"   ;;
    2 ) echo "$1 not found in path"             ;;
esac

exit 0