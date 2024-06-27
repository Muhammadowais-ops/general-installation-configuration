#!/bin/bash

set -x
while read myv
do
	echo $myv
done < t.txt
