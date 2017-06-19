#!/bin/sh

status_white=19
gpio_dir=/sys/class/gpio


if [ -e "${gpio_dir}/gpio19" ]
then
    echo 19 > /sys/class/gpio/unexport
fi

if [ ! -e "${gpio_dir}/gpio19" ]
then
    echo 19 > /sys/class/gpio/export
fi

echo "out" > ${gpio_dir}/gpio19/direction


echo 1 > ${gpio_dir}/gpio19/value

