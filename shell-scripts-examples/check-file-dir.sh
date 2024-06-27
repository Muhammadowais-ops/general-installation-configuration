#!/bin/bash

if [[ -f file.csv ]]
then
	echo "file exist"
else
	echo "not exit"
fi

if [[ ! -f file.csv ]]
then
        echo "file"
else
        echo "not condition exit"
fi



if [[ -d /root/shell-scripts ]]
then
	echo "directory there"
else
	echo "not there"
fi	


if [[ ! -d /root/shell-scripts ]]
then
        echo "directory there"
else
        echo "not there"
fi

