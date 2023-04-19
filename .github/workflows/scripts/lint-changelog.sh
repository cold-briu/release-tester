#!/bin/bash

raw_input='These are demo release notes for human changelog\n\nnew features:\n- new fun 🥳\n- other feat 🥳\n\nbreaking changes:\n- more stuff 🤯\n\nfixes:\n- no bugs 😇\n\n'


function get_lines() {
    local raw_input="$1"

    mapfile -t lines < <( echo $raw_input | awk -F'\\\\n' '{for(i=1; i<=NF; i++) print $i}' )
}

function check_block() {
    local block_name="$1"
    local block_found=false

    for i in "${!lines[@]}"
        do
            if [[ "${lines[$i]}" == "$block_name"* ]]; then

                echo "found at $i: ${lines[$i]}"
                block_found=true

            elif [[ "$block_found" == true && "${lines[$i]}" =~ ^-.* ]]; then
                echo "Item: ${lines[$i]}"
            elif [[ "$block_found" == true ]]; then
                break
            fi
        done
}

function linter() {
#   get_lines "$raw_input"
    lines=()

    get_lines "$raw_input"

    check_block  "new features:"
    check_block  "fixes:"
    check_block  "breaking changes:"


    # for i in "${!lines[@]}"
    # do
    #     echo "$i: ${lines[$i]}"
    # done
}

linter "$raw_input"


