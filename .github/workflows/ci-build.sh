#!/usr/bin/env bash

_build() {
  pyinstaller "build.spec"
}

_build
