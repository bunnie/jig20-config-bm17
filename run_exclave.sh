#!/bin/sh

echo "26" > /sys/class/gpio/export
sleep 1
echo out > /sys/class/gpio/gpio26/direction
sleep 1
echo 1 > /sys/class/gpio/gpio26/value
sleep 1

/home/pi/.cargo/bin/exclave -c /home/pi/code/jig20-config-bm17
