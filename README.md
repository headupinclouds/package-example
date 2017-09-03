Build libfoo, uses spdlog:
```
cmake -HFoo -B_builds/Foo-release -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="`pwd`/_install"
cmake --build _builds/Foo-release --target install
```

Build boo, uses libfoo (->spdlog):
```
cmake -HBoo -B_builds/Boo -DCMAKE_PREFIX_PATH="`pwd`/_install"
cmake -HBoo -B_builds/Boo -DFoo_DIR="`pwd`/_install/lib/cmake/Foo"
```