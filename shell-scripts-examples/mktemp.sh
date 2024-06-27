#!/bin/bash

set -x

file=$(mktemp)



for x in $file
do
	echo "creating temproray files and directory"
	ls -l $x
	ls -ld $x -d
	ls $x -t random-XXXXXXXX
done
