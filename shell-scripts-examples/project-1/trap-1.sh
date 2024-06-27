#!/bin/bash

echo "we are using the trap concept"

echo $$

trap "echo you can exit the script; exit 1" INT EXIT KILL


for (( ;; ))
do
	echo "hello"
	sleep 1
done
