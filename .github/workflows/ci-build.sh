#!/usr/bin/env bash

_sys="mingw64"
_sys="ucrt64"
_bin="/${_sys}/bin"

_prepare() {
  "pip" install pyinstaller
}

_build() {
  "pip" install -r "requirements.txt"
}

_package() {
  "pyinstaller" "build.spec"
}

_prepare
_build
_package
ls
