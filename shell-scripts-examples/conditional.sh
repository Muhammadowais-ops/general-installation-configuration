#!/bin/bash

read -p "enter your marks " mark

if [[ $mark -gt 10 ]]
then
	echo "yes marks are grater than 10"
else
	echo "nothing"
fi
