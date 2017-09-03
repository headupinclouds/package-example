#!/bin/bash

. toolchain.sh

#cmake -HBoo -B_builds/Boo -DCMAKE_PREFIX_PATH="`pwd`/_install"
#cmake -HBoo -B_builds/Boo -DFoo_DIR="`pwd`/_install/lib/cmake/Foo"

HUNTER_CACHE=$(cat _builds/Foo/_builds/${TOOLCHAIN}/_3rdParty/Hunter/install-root-dir)
echo "HUNTER_CACHE = ${HUNTER_CACHE}"

ARGS=(
    Foo_DIR="${PWD}/_install/${TOOLCHAIN}/lib/cmake/Foo"
    spdlog_DIR="${HUNTER_CACHE}/lib/cmake/spdlog"
)

mkdir -p _builds/Boo
polly.py --toolchain ${TOOLCHAIN} --home Boo --output _builds/Boo --install --clear --verbose --fwd ${ARGS[@]}
