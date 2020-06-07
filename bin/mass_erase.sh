#!/bin/sh

sleep 1

sudo /usr/local/bin/openocd -l /dev/fd/1 -f /home/pi/code/cubegarden/src/raspi.cfg -c "transport select swd" -f target/kx.cfg -c "init" -c "kinetis fcf_source protection" -c "kinetis fopt 0xf9" -c "reset halt" -c "kinetis mdm mass_erase" -c "exit"

sleep 1

echo "PASS"
exit 0



