#!/bin/sh -e

. ./00-test-lib.sh

#if $(egrep -m 1 '(PASS|FAIL)' ${uart}) | grep -iq PASS

while [ 1 ]
do
    line=$(egrep -m 1 '(PASS|FAIL)' ${uart})
    if echo "${line}" | grep -iq 'PASS'
    then
	echo "WOOOO"
	exit 0
    elif echo "${line}" | grep -iq 'FAIL'
    then
	echo "SAD."
	exit 1
    fi
done

