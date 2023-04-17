#!/bin/bash

# get the input parameter
raw_release_notes=$1

# lint the release notes
linted_release_notes=$(echo "${raw_release_notes}" | sed 's/$/\\n/' | tr -d '\n')

# output the linted release notes
echo "${linted_release_notes}"