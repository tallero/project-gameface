#!/usr/bin/env bash

_sys="ucrt64"
_bin="/${_sys}/bin"

_setup_numpy() {
  local _commit \
        _ns \
	_pkg \
	_pkgname \
	_prefix \
	_url \
	_ver \
	pkgname
  _prefix="mingw-w64"
  _pkg="python-numpy"
  _ver="1.22.0"
  _pkgname="${_pkg}-${_ver}"
  pkgname="${_prefix}-${_pkgname}"
  _ns="mingw-aur"
  _commit="41859485d2f57bbd1df551220d45b256607977be"
  _url="https://github.com/${_ns}/${pkgname}"
  git clone "${_url}"
  cd "${pkgname}"
  git checkout "${_commit}"
  makepkg-mingw --nocheck
  pacman -Rdd "${_prefix}-${_pkg}"
  pacman -U "${_prefix}"*"${_pkgname}"*".pkg.tar"* \
	    --noconfirm
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
