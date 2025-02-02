#!/bin/bash
set -ex

# set up
PROJECT=str
GROUP=rphii

# make sure all variables are set
if [[ -z "${CC}" ]]; then
    echo "CC= (c compiler) is empty!" 1>&2
    exit -1
fi

# compile
mkdir -p build/{32,64} || true
$CC $CFLAGS -o "build/32/${PROJECT}.so" -m32 src/*.c -shared -fPIC
$CC $CFLAGS -o "build/64/${PROJECT}.so" -m64 src/*.c -shared -fPIC

