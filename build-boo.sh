#!/bin/bash

. toolchain.sh

#cmake -HBoo -B_builds/Boo -DCMAKE_PREFIX_PATH="`pwd`/_install"
#cmake -HBoo -B_builds/Boo -DFoo_DIR="`pwd`/_install/lib/cmake/Foo"

FOO_TOP_DIR="${PWD}/_builds/Foo"
FOO_BUILD_DIR="${FOO_TOP_DIR}/_builds/${TOOLCHAIN}"
FOO_INSTALL_DIR="${FOO_TOP_DIR}/_install/${TOOLCHAIN}"

echo ${FOO_BUILD_DIR}
echo ${FOO_INSTALL_DIR}

HUNTER_CACHE=$(cat ${FOO_BUILD_DIR}/_3rdParty/Hunter/install-root-dir)
echo "HUNTER_CACHE = ${HUNTER_CACHE}"

ARGS=(
    Foo_DIR="${FOO_INSTALL_DIR}/lib/cmake/Foo"
    spdlog_DIR="${HUNTER_CACHE}/lib/cmake/spdlog"
)

mkdir -p _builds/Boo
polly.py --toolchain ${TOOLCHAIN} --home Boo --output _builds/Boo --install --clear --verbose --fwd ${ARGS[@]}
