#!/usr/bin/env bash

_sys="mingw64"
_sys="ucrt64"
_bin="/${_sys}/bin"

_build() {
  "${_bin}/pip" install -u requirements.txt \
	                --prefer-binary
}

_package() {
  "${_bin}/pyinstaller" "build.spec"
}

_build
_package
ls
