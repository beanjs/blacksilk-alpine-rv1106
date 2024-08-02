#!/bin/sh

root=$(dirname $(realpath $0))

setup-xorg-base
apk add --no-cache xfce4 xfce4-terminal lightdm-gtk-greeter dbus onboard

cp -rf $root/etc/* /etc

rc-update add dbus default
rc-update add lightdm default