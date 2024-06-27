#!/bin/bash


read -p "give your value " a

if [[ $a -gt 20 ]]
then
	echo "hell"
elif [[ $a -le 5 ]]
then
	echo "elif"
else
	echo "new"
fi

