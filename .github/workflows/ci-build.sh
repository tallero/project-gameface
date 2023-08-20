#!/usr/bin/env bash

_sys="ucrt64"
_bin="/${_sys}/bin"

_setup_numpy() {
  local _github \
	_commit \
	_files=()
	_pkg \
	_pwd \
	_url
  _pkg="python-numpy"
  _numpyver="1.22.0"
  _ns="mingw-aur"
  _commit="bc5d8d9510c590f2958daa3ae2753cac3709690e"
  git clone "https://github.com/${_ns}/mingw-w64-${_pkg}-${_numpyver}"
  cd "${_pkg}"
  git checkout "${_commit}"
  makepkg-mingw --nocheck
  pacman -U "mingw"*"${_pkg}"*".pkg.tar"* --noconfirm
  cd ".."
}

_build() {
  "${_bin}/pip" install -r "./requirements.txt" \
	                --prefer-binary
}

_package() {
  "${_bin}/pyinstaller" "build.spec"
}

_setup_numpy
_build
_package
ls
