#! /bin/sh

sudo ifconfig usb0 192.168.137.1
sudo ifconfig usb0 up
sudo iptables -t nat -A POSTROUTING -s 192.168.137.0/24 -o enp3s0 -j MASQUERADE