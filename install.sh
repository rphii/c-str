#!/bin/bash
set -ex

if [[ -z $PREFIX ]]; then
	PREFIX=/
fi

# set up
PROJECT=str
GROUP=rphii
DIR_INCLUDES="$PREFIX/usr/include/${GROUP}"

# create system directories
mkdir -p "${DIR_INCLUDES}" || true

# install
cp src/*.h "${DIR_INCLUDES}"

#DIR_LIBS_64="lib64"
if [[ -n LIBS_64 ]]; then
	DIR_LIBS_64="$PREFIX/$LIBS_64/${GROUP}"
	mkdir -p "${DIR_LIBS_64}" || true
	cp "build/64/${PROJECT}.so" "${DIR_LIBS_64}"
fi

#DIR_LIBS_32="lib"
if [[ -n LIBS_32 ]]; then
	DIR_LIBS_32="$PREFIX/$LIBS_32/${GROUP}"
	mkdir -p "${DIR_LIBS_32}" || true
	cp "build/32/${PROJECT}.so" "${DIR_LIBS_32}"
fi

