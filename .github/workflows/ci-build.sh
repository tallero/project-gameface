#!/usr/bin/env bash

_sys="mingw64"
_sys="ucrt64"
_bin="/${_sys}/bin"

_prepare() {
  local _github _commit _pkg
  _pkg="python-numpy"
  _github="https://raw.githubusercontent.com"
  _commit="7ffcd8f7ffa0bf161da4ff40ee9444eb382fa8e0"
  _url="${_github}/msys2/MINGW-packages/${_commit}/mingw-w64-${_pkg}/PKGBUILD"
  mkdir "${HOME}/${_pkg}"
  cd "${HOME}/${_pkg}"
  wget "${_url}"
  makepkg
  pacman -U "${_pkg}"*.pkg.tar* --noconfirm
}

_build() {
  "${_bin}/pip" install -r requirements.txt \
	                --prefer-binary
}

_package() {
  "${_bin}/pyinstaller" "build.spec"
}

_build
_package
ls
