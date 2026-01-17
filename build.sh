#!/usr/bin/env bash

set -e
set -o pipefail

# Build CMake from source
cd /external/src/cmake
./bootstrap --prefix=/external
make -j10
make install

cd /external/src
