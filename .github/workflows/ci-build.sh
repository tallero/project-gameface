#!/usr/bin/env bash

_sys="mingw64"
_sys="ucrt64"
_bin="/${_sys}/bin"

_build() {
  local _pkgs=(
    flatbuffers==2.0.0
    matplotlib==3.7.1
    opencv-contrib-python==4.7.0.72
    psutil==5.9.4
    pyautogui==0.9.53
    customtkinter==5.1.2
    PyDirectInput==1.0.4
    pywin32==306
    mediapipe==0.9.3.0)
  "pip" install "${_pkgs[@]}"
}

_package() {
  "pyinstaller" "build.spec"
}

_build
_package
ls
