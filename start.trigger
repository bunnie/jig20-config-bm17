[Trigger]
Name=Start button
Description=A start button on the Chibiscreen jig, pin 10.  Compile with 'gcc gpiopoll.c -o gpiopoll; sudo chown root gpiopoll; sudo chmod u+s gpiopoll'
ExecStart=./gpiopoll 10
