#!/bin/bash

say_hello() {
    echo "Hello, $1!"
}

add() {
    echo $(( $1 + $2 ))
}
