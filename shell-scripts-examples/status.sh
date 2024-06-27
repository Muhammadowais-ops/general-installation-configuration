#!/bin/bash

read -p "provide file name " name

ls -l $name 

if [[ $? -eq 0 ]]
then
	echo "you file found on the path"
else
	echo "not found"
fi
