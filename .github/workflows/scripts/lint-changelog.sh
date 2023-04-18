#!/bin/bash

# get the input parameter
raw_release_notes=$1

# # Check if the string contains the expected structure
# if [[ ! "$raw_release_notes" =~ ^new\ features: ]]; then
#   echo "Expected 'new features: ' section not found in release notes"
#   exit 1
# fi

# if [[ ! "$raw_release_notes" =~ ^breaking\ changes: ]]; then
#   echo "Expected 'breaking changes: ' section not found in release notes"
#   exit 1
# fi

# if [[ ! "$raw_release_notes" =~ ^fixes: ]]; then
#   echo "Expected 'fixes: ' section not found in release notes"
#   exit 1
# fi


# output the linted release notes
echo "${raw_release_notes}"
