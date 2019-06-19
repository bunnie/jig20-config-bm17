#!/bin/sh

export_pin ${status_blue}
export_pin ${status_yellow}
set_output ${status_blue}
set_output ${status_yellow}
set_high ${status_blue}
set_low ${status_yellow}

max=5
for i in $(seq 1 5)
do
	echo "Programming test OS (try ${i}/${max})"
	echo "reset halt" | netcat localhost 4444 > /dev/null
	echo "kinetis fcf_source protection" | ncat localhost 4444 > /dev/null
	echo "kinetis fopt 0xf9" | ncat localhost 4444 > /dev/null
	echo "reset halt" | netcat localhost 4444 > /dev/null
	if echo program $(pwd)/cube.elf | netcat localhost 4444 | grep -q "Programming Finished" 2> /dev/null
	then
		echo "Programmed successfully"

		echo "reset" | netcat localhost 4444 > /dev/null
		# Disable reset, so we can use it in future tests
		echo "reset_config none" | netcat localhost 4444 > /dev/null
		killall -STOP openocd
		exit 0
	fi
	echo "Failed to program.  Trying a mass_erase"

	# This sleep seems required, otherwise it will fail if called
	# immediately after a "program" has failed.
#	sleep .5
	echo "kinetis mdm mass_erase" | netcat localhost 4444 > /dev/null
#	echo "Failed to program."
done

echo "Failed to program OS after ${max} tries"
exit 1
