#!/usr/bin/env bash

_bin="/mingw64/bin"

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
