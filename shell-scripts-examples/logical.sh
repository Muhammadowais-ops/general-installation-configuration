#!/bin/bash

a=10
b="20"

if [[ $a -gt 1 ]] && [[ $b == "20" ]]
then
	echo "condition god"
else
	echo "no working"
fi
