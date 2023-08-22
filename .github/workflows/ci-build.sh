#!/usr/bin/env bash

_sys="ucrt64"
_bin="/${_sys}/bin"

_package() {
  "${_bin}/pyinstaller" "build.spec"
}

# bash "setup-msgbox.sh"
# bash "setup-numpy.sh"
# bash "setup-opencv.sh"
_package
ls
