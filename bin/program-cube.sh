#!/bin/sh

max=3
for i in $(seq 1 3)
do
   echo "Programming OS (try ${i}/${max})"
   if sudo /usr/local/bin/openocd -l /dev/fd/1 -f bcm-rpi-prog.cfg | grep -q "Programming Finished" 2> /dev/null
   then
       echo "Programmed Successfully"
       sleep 5  # wait for self-test to run so we get to interactive command line
       exit 0
   fi
   echo "Failed to program. Trying again"
   sleep 1
done
sudo killall -9 openocd
exit 1

