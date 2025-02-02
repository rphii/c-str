#!/bin/bash
set -ex

# set up
PROJECT=str
GROUP=rphii
DIR_INCLUDES="/usr/include/${GROUP}"
DIR_LIBS_32="/lib/${GROUP}"
DIR_LIBS_64="/lib64/${GROUP}"

# make sure all variables are set
if [[ -z "${CC}" ]]; then
    echo "CC= (c compiler) is empty!" 1>&2
    exit -1
fi

# create system directories
mkdir -p "${DIR_INCLUDES}" || true
mkdir -p "${DIR_LIBS_32}" || true
mkdir -p "${DIR_LIBS_64}" || true

# compile
mkdir -p build/{32,64}
$CC $CFLAGS -o "build/32/${PROJECT}.so" -m32 src/*.c -shared -fPIC
$CC $CFLAGS -o "build/64/${PROJECT}.so" -m64 src/*.c -shared -fPIC

# install
cp src/*.h "${DIR_INCLUDES}"
cp "build/32/${PROJECT}.so" "${DIR_LIBS_32}"
cp "build/64/${PROJECT}.so" "${DIR_LIBS_64}"


