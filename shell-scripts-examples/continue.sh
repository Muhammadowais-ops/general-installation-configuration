#!/bin/bash

for r in 1 2 3 4 5 6 7 8 9 10
do
	let k=$r%2
	if [[ $k -eq 0 ]]
	then 
		continue
	fi
	echo "odd no is $r"
done
