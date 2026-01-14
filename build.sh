#!/usr/bin/env bash

set -e
set -o pipefail

# Find all the package directories in /external like /external/cmake-4.2.1-linux-aarch64 and
# move their contents to /external so that we can create a single unified /external/bin, lib, etc
# At the end remove the now empty package directories
for dir in /external/*/; do
    if [ -d "$dir" ]; then
        sudo mv "$dir"* /external/
        sudo rmdir "$dir"
    fi
done
ls -alhs /external
