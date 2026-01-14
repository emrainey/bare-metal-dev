#!/usr/bin/env bash

set -e
set -o pipefail

mkdir -p /external
chmod 0755 /downloads/*
chown dev:dev /downloads/*
tar -xvzf /downloads/cmake-4.2.1-linux-aarch64.tar.gz --strip-components=1 -C /external
ls -als /downloads
ls -als /external