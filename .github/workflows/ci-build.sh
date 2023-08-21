#!/usr/bin/env bash

_sys="ucrt64"
_bin="/${_sys}/bin"

_package() {
  "${_bin}/pyinstaller" "build.spec"
}

_package
ls
