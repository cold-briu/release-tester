#!/bin/bash

# get the input parameter
raw_release_notes=$1

# Check if the file contains the expected structure
if ! grep -q '^new features:' "$1"; then
  echo "Expected 'new features: ' section not found in file: $1"
  exit 1
fi

if ! grep -q '^breaking changes:' "$1"; then
  echo "Expected 'breaking changes: ' section not found in file: $1"
  exit 1
fi

if ! grep -q '^fixes:' "$1"; then
  echo "Expected 'fixes: ' section not found in file: $1"
  exit 1
fi


# bypass:  remove line breaks
linted_release_notes=$raw_release_notes

# output the linted release notes
echo "${linted_release_notes}"