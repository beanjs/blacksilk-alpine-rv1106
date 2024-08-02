#!/bin/sh

WPA_FILE=/etc/wpa_supplicant/wpa_supplicant.conf

if [ ! -e "$WPA_FILE" ] ; then 
  echo -n "please input wifi ssid: "
  read ssid
  echo -n "please input wifi password: "
  read password

  wpa_passphrase "$ssid" "$password" > $WPA_FILE
fi

wpa_supplicant -B -i wlan0 -c $WPA_FILE
udhcpc -i wlan0