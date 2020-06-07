[Trigger]
Name=Start button
Description=A start button on the Chibiscreen jig, pin 26.  Compile with 'gcc gpiopoll.c -o gpiopoll; sudo chown root gpiopoll; sudo chmod u+s gpiopoll'
ExecStart=/home/pi/code/jig20-config-bm17/bin/gpiopoll 21
WorkingDirectory=/home/pi/code/jig20-config-bm17/bin
