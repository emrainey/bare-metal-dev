#!/usr/bin/env bash

set -e
set -o pipefail

mkdir -p /external/src
chmod -R 777 /external
chown -R dev:dev /external
# Extract the archives into the /external directory
git clone --branch v4.2.1 https://github.com/Kitware/CMake.git /external/src/cmake
# Build CMake from source
cd /external/src/cmake
./bootstrap --prefix=/external
make -j10
make install

cd /external/src
