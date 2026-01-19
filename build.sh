#!/usr/bin/env bash

set -e
set -o pipefail

mkdir -p /external/src
# Extract the archives into the /external source directory
git clone --branch v4.2.1 https://github.com/Kitware/CMake.git /external/src/cmake
# Build CMake from source
cd /external/src/cmake
./bootstrap --prefix=/external
make -j10
make install
