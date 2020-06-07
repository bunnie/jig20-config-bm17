#!/bin/sh

#. ./00-test-lib.sh

#export_pin ${status_blue}
#export_pin ${status_yellow}
#set_output ${status_blue}
#set_output ${status_yellow}
#set_high ${status_blue}
#set_low ${status_yellow}

echo "STARTING PROGRAMMING OPERATION"

sudo /usr/local/bin/openocd -l /dev/fd/1 -f /home/pi/code/cubegarden/src/bcm-rpi-prog.cfg

echo "ENDED PROGRAMMING OPERATION"

sleep 7

echo "PASS"
exit 0

