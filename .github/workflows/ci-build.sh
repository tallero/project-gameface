#!/usr/bin/env bash

_sys="mingw64"
_sys="ucrt64"
_bin="/${_sys}/bin"

_prepare() {
  "${_bin}/pip" install pyinstaller
}

_build() {
  "${_bin}/pip" install -r "requirements.txt"
}

_package() {
  "${_bin}/pyinstaller" "build.spec"
}

_prepare
_build
_package
