#!/bin/bash

. toolchain.sh

#cmake -HFoo -B_builds/Foo-release -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="`pwd`/_install"
#cmake --build _builds/Foo-release --target install

mkdir -p _builds/Foo
polly.py --toolchain ${TOOLCHAIN} --home Foo --output _builds/Foo --clear --verbose --install
