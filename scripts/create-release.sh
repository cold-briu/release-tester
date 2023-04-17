#!/bin/bash

# Get the current version from the stored file or set it to 1.0.0 if the file doesn't exist
current_version=$(cat version.txt 2>/dev/null || echo "1.0.0")

# Increment the version number
major=$(echo "$current_version" | cut -d '.' -f 1)
minor=$(echo "$current_version" | cut -d '.' -f 2)
patch=$(echo "$current_version" | cut -d '.' -f 3)
patch=$((patch+1))
new_version="$major.$minor.$patch"

# Write the new version to the file
echo "$new_version" > version.txt

# Create a new release in the remote repository using the hub command-line tool
tag_name="$new_version"
title="Release $new_version"
body="This is release $new_version."
gh release create "v$tag_name" --title "$title" --notes-file ./changelog.md 
echo "Created release $tag_name"
