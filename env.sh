#!/bin/bash
# Sources the Belle II custom stack environment

export SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
export PREFIX="$SCRIPT_DIR/install"

export PATH="$PREFIX/bin:$PATH"
export LD_LIBRARY_PATH="$PREFIX/lib:$PREFIX/lib64:$LD_LIBRARY_PATH"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig:$PREFIX/lib64/pkgconfig:$PKG_CONFIG_PATH"
export CPATH="$PREFIX/include:$CPATH"

echo "Environment loaded. Using Python from: $(which python3)"