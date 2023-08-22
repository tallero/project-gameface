#!/usr/bin/env bash

_set_prefix() {
  [[ "${MINGW_PACKAGE_PREFIX}" == ""  ]] && \
   echo "MINGW_PACKAGE_PREFIX variable was not set" && \
   export MINGW_PACKAGE_PREFIX="mingw-w64-ucrt-x86_64" 
}

_setup_pymsgbox() {
  local _commit \
        _ns \
	_pkg \
	_pkgname \
	_prefix \
	_url \
	_ver \
	pkgname
  _prefix="mingw-w64"
  _pkg="pymsgbox"
  _ver="1.0.9"
  _pkgname="${_pkg}-${_ver}"
  pkgname="${_prefix}-${_pkgname}"
  _ns="mingw-aur"
  _commit="bec1d5423f32a7b6ac2e0e24c2608f85b4634ca6"
  _url="https://github.com/${_ns}/${_prefix}-python-${_pkg}"
  git clone "${_url}"
  cd "${_prefix}-python-${_pkg}"
  git checkout "${_commit}"
  makepkg-mingw --nocheck
  pacman -Rdd "${MINGW_PACKAGE_PREFIX}-${_pkg}" \
              "${MINGW_PACKAGE_PREFIX}-python-${_pkg}" \
	      --noconfirm
  pacman -U "${MINGW_PACKAGE_PREFIX}"*".pkg.tar"* \
	    --noconfirm
  cd ".."
}

_setup_pymsgbox

# vim:set sw=2 sts=-1 et:
