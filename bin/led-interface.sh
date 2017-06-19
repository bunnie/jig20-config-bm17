#!/bin/sh

white_led=19
blue_led=13
yellow_led=6

all_off() {
	gpio -g write ${white_led} 0
	gpio -g write ${yellow_led} 0
	gpio -g write ${blue_led} 0
}

blue_on() {
	gpio -g write ${blue_led} 1
}

yellow_on() {
	gpio -g write ${yellow_led} 1
}

white_on() {
	gpio -g write ${white_led} 1
}

blue_off() {
	gpio -g write ${blue_led} 0
}

yellow_off() {
	gpio -g write ${yellow_led} 0
}

white_off() {
	gpio -g write ${white_led} 0
}

yellow_also_on() {
	gpio -g write ${yellow_led} 1
}

gpio_setup() {
	gpio -g mode ${blue_led} out
	gpio -g mode ${yellow_led} out
	gpio -g mode ${white_led} out
	white_on
}

gpio_setup

echo "HELLO bash-ltc-jig 1.0"

white_on

while read line
do
	if echo "${line}" | grep -i '^start'
	then
		blue_on
	elif echo "${line}" | grep -i '^fail'
	then
		yellow_also_on
	elif echo "${line}" | grep -iq '^finish'
	then
		result=$(echo ${line} | awk '{print $3}')
		if [ ${result} -ge 200 -a ${result} -lt 300 ]
		then
		    blue_off  #pass
		    yellow_off
		else
		    blue_off    #fail
		    yellow_off
		fi
	elif echo "${line}" | grep -iq '^exit'
	then
	    white_off
		exit 0
	fi
done
