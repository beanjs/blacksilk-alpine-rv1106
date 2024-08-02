#!/bin/sh

GPIO_PIN=6
GPIO_PATH="/sys/class/gpio/gpio$GPIO_PIN"

echo host > /sys/devices/platform/ff3e0000.usb2-phy/otg_mode
sleep 10

echo $GPIO_PIN > /sys/class/gpio/export
echo out > $GPIO_PATH/direction
echo 1 > $GPIO_PATH/value
sleep 5

insmod /lib/modules/5.10.160/aic_load_fw.ko
insmod /lib/modules/5.10.160/aic8800_fdrv.ko
insmod /lib/modules/5.10.160/aic_btusb.ko
sleep 5

ifconfig wlan0 up

# wpa_passphrase "WY216" "wy12345678" > /etc/wpa_supplicant/wpa_supplicant.conf
# wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf
# udhcpc -i wlan0
