#!/usr/bin/env bash

_sys="mingw64"
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
  _github="https://raw.githubusercontent.com"
  _commit="7ffcd8f7ffa0bf161da4ff40ee9444eb382fa8e0"
  _url="${_github}/msys2/MINGW-packages/${_commit}/mingw-w64-${_pkg}"
  _files=(
    "PKGBUILD"
    "0001-detect-mingw-environment.patch"
    "0002-fix-finding-python2.patch"
    "0003-gfortran-better-version-check.patch"
    "0004-fix-testsuite.patch"
    "0005-mincoming-stack-boundary-32bit-optimized-64bit.patch"
    "0006-disable-visualcompaq-for-mingw.patch"
    "0007-disable-64bit-experimental-warning.patch"
    "0008-mingw-gcc-doesnt-support-visibility.patch"
    "0010-mingw-inline-stuff.patch"
    "0011-dont-die-if-no-fcompiler.patch"
    "0012-clang-no-gcc-workaround.patch")
  mkdir "${HOME}/${_pkg}"
  _pwd="$(pwd)"
  cd "${HOME}/${_pkg}"
  for _file in "${_files[@]}"; do
    wget "${_url}/${_file}"
  done
  makepkg-mingw
  pacman -U "${_pkg}"*.pkg.tar* --noconfirm
  cd "${_pwd}"
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
