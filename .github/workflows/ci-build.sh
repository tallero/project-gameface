#!/usr/bin/env bash

_sys="ucrt64"
_bin="/${_sys}/bin"

_package() {
  "${_bin}/pyinstaller" "build.spec"
}

# bash "setup_msgbox.sh"
# bash "setup_numpy.sh"
# bash "setup_opencv.sh"
_package
ls
