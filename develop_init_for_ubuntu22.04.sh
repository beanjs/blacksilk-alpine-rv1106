#!/bin/bash

# packages="
# adb
# android-sdk-platform-tools-common
# android-tools-adb
# autoconf
# automake
# autopoint
# autotools-dev
# binutils
# bison
# build-essential
# ca-certificates
# ccache
# chrpath
# cmake
# cmake-data
# codesearch
# command-not-found
# console-setup
# coreutils
# cpio
# cpp
# cpp-9
# curl
# device-tree-compiler
# dos2unix
# dosfstools
# f2fs-tools
# fakeroot
# flex
# g++
# g++-9
# gawk
# gcc
# gcc-10-cross-base
# gcc-9
# gcc-9-cross-base
# genext2fs
# gettext
# gettext-base
# gfortran
# gfortran-9
# ghostscript
# git
# git-man
# lz4
# lzop
# m4
# make
# makeself
# man-db
# manpages
# manpages-dev
# mawk
# mdadm
# meson
# minicom
# mtd-utils
# mtools
# ncurses-base
# ncurses-bin
# ncurses-term
# net-tools
# ninja-build
# openssl
# perl
# python-pkg-resources
# python2
# python2-dev
# python2-minimal
# python2.7
# python2.7-dev
# python2.7-minimal
# python3
# python3-pexpect
# python3-pip
# python3-pyinotify
# python3-pymacaroons
# python3-pyparsing
# python3-requests
# python3-texttable
# python3-venv
# python3-dev
# python3-minimal
# python3-venv
# python-is-python3
# qemu
# qemu-efi-aarch64
# qemu-efi-arm
# qemu-system-arm
# qemu-system-common
# qemu-system-data
# qemu-system-x86
# qemu-user-static
# qemu-utils
# rsync
# squashfuse
# ssh
# ssh-import-id
# sshfs
# texinfo
# u-boot-tools
# usb-modeswitch
# usb-modeswitch-data
# usbutils
# uuid
# uuid-runtime
# wget
# bc
# libssl-dev
# pkg-config
# gperf
# "

packages="
bc
bison
build-essential
cmake
device-tree-compiler
flex
gperf
libssl-dev
make
pkg-config
python3-minimal
python-is-python3
texinfo
"

sudo apt update
sudo apt install --fix-missing
sudo apt install $packages --fix-missing

