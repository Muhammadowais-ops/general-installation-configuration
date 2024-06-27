#!/bin/bash

for k in 1 2 3
do
	echo $k 
	sleep 1s
done


for kk in "a" 1 "c"
do
	echo $kk
done


tt=/etc/passwd

for d in $(cat $tt)
do
	echo $d
done


dd=( 1 2 "hell" )

c=${#dd[*]}

for (( i=0;i<$c;i++))
do
	echo $i
done
