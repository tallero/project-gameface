#!/usr/bin/env bash

_set_prefix() {
  [[ "${MINGW_PACKAGE_PREFIX}" == ""  ]] && \
   echo "MINGW_PACKAGE_PREFIX variable was not set" && \
   export MINGW_PACKAGE_PREFIX="mingw-w64-ucrt-x86_64" 
}

_setup_opencv() {
  local _commit \
        _ns \
	_pkg \
	_pkgname \
	_prefix \
	_url \
	_ver \
	pkgname
  _prefix="mingw-w64"
  _pkg="opencv"
  _ver="4.7"
  _pkgname="${_pkg}-${_ver}"
  pkgname="${_prefix}-${_pkgname}"
  _ns="mingw-aur"
  _commit="e40e64d28a8fcc9eb6f347fa81c41c2183cb8ff8"
  _url="https://github.com/${_ns}/${pkgname}"
  git clone "${_url}"
  cd "${pkgname}"
  git checkout "${_commit}"
  makepkg-mingw --nocheck
  pacman -Rdd "${MINGW_PACKAGE_PREFIX}-${_pkg}" \
              "${MINGW_PACKAGE_PREFIX}-python-${_pkg}" \
	      --noconfirm
  pacman -U "${MINGW_PACKAGE_PREFIX}"*".pkg.tar"* \
	    --noconfirm
  cd ".."
}

# vim:set sw=2 sts=-1 et:
