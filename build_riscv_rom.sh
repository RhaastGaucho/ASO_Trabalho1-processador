#!/bin/bash

while read -r opc ra rb rc const1 const2 const3 const4; do
	echo -en "\x${opc}${ra}\x${rb}${rc}\x${const1}${const2}\x${const3}${const4}"
done
