#!/bin/bash

raw_input='These are demo release notes for human changelog\n\nnew features:\n- new fun 🥳\n\nbreaking changes:\n- more stuff 🤯\n\nfixes:\n- no bugs 😇\n\n'

function get_lines() {
    local raw_input="$1"
    
    mapfile -t lines < <( echo $raw_input | awk -F'\\\\n' '{for(i=1; i<=NF; i++) print $i}' )
}


function linter() {
#   get_lines "$raw_input"
    lines=()

    get_lines "$raw_input"

    for i in "${!lines[@]}"
    do
        echo "Line $i: ${lines[$i]}"
    done
}

linter "$raw_input"


