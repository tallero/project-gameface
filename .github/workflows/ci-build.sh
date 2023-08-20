#!/usr/bin/env bash

_prepare() {
  pip install pyinstaller
}

_build() {
  pyinstaller "build.spec"
}

_prepare
_build
