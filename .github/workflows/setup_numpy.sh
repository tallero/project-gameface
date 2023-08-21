#!/usr/bin/env bash

_set_prefix() {
  [[ "${MINGW_PACKAGE_PREFIX}" == ""  ]] && \
   echo "MINGW_PACKAGE_PREFIX variable was not set" && \
   export MINGW_PACKAGE_PREFIX="mingw-w64-ucrt-x86_64" 
}

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
  pacman -Rdd "${MINGW_PACKAGE_PREFIX}-${_pkg}" \
	 --noconfirm
  pacman -U "${MINGW_PACKAGE_PREFIX}-${_pkgname}"*".pkg.tar"* \
	    --noconfirm
  cd ".."
}

# vim:set sw=2 sts=-1 et:
