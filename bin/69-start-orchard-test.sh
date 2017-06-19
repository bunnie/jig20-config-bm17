#!/bin/sh 

. ./00-test-lib.sh

# reset_board
sleep 1
echo "running self test"
stty -F /dev/ttyUSB0 115200 -icrnl -imaxbel -opost -onlcr -isig -icanon -echo
sleep 1
printf "testall 3\r\n" > /dev/ttyUSB0
sleep 1

exit 0
